class ChallengesController < ApplicationController
  before_action :authenticate_employee!

  def index
    @challenge = Challenge.new

    sort_criteria = params[:sort]
    if sort_criteria == "created_at"
      @challenges = Challenge.order(sort_criteria)
    elsif sort_criteria == "votes"
      @challenges = Challenge.all.sort_by { |challenge| challenge.votes.count }.reverse
    else
      @challenges = Challenge.all
    end

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @challenges, status: :ok }
    end
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.employee = current_employee

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to challenges_path, notice: 'Challenge was successfully created.' }
        format.json { render json: @challenge, status: :created, location: @challenge }
      else
        format.html { redirect_to challenges_path, alert: 'Challenge was not successfully created.' }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def upvote
    @challenge = Challenge.find(params[:id])

    if @challenge.employee == current_employee
      respond_to do |format|
        format.html { redirect_to challenges_path, alert: "You can't vote your own challenge." }
        format.json { render json: @challenge, status: :forbidden, location: @challenge }
      end
    elsif @challenge.votes.exists?(employee_id: current_employee.id)
      respond_to do |format|
        format.html { redirect_to challenges_path, alert: "You can't vote more than once." }
        format.json { render json: @challenge, status: :forbidden, location: @challenge }
      end
    else
      @challenge.votes.create(employee_id: current_employee.id)
      respond_to do |format|
        format.html { redirect_to challenges_path, notice: "Challenge was successfully upvoted." }
        format.json { render json: @challenge, status: :created, location: @challenge }
      end
    end
  end

  def collaborate
    @challenge = Challenge.find(params[:id])
    
    if @challenge.employee == current_employee
      respond_to do |format|
        format.html { redirect_to challenges_path, alert: "You can't collaborate on your own challenge." }
        format.json { render json: @challenge, status: :forbidden, location: @challenge }
      end
    elsif @challenge.employees.exists?(employee_id: current_employee.employee_id)
      respond_to do |format|
        format.html { redirect_to challenges_path, alert: "You are already collaborating on this challenge." }
        format.json { render json: @challenge, status: :forbidden, location: @challenge }
      end
    else
      @challenge.employees << current_employee
      respond_to do |format|
        format.html { redirect_to challenges_path, notice: "You are successfully added to the collaborators list." }
        format.json { render json: @challenge, status: :created, location: @challenge }
      end
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def challenge_params
    params.require(:challenge).permit(:title, :description, :tag_id)
  end
end
