class ChallengesController < ApplicationController
  before_action :authenticate_employee!

  def index
    @challenge = Challenge.new
    @challenges = Challenge.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @challenges }
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
        format.json { render json: @challenge, status: :success, location: @challenge }
      end
    end
  end

  def collaborate
    @challenge = Challenge.find(params[:id])
    @challenge.collaborators << current_employee unless @challenge.employee == current_employee

    respond_to do |format|
      format.html { render :index, notice: 'Successfully collaborated in Challenge' }
      format.json { render json: @challenge, status: :success }
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def challenge_params
    params.require(:challenge).permit(:title, :description, :tag_id)
  end
end
