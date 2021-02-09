class ChallengesController < ApplicationController
  before_action :authenticate_employee!
  before_action :find_challenge, only: %w[upvote collaborate]

  def index
    # To Add new Challenge from Index page
    @challenge = Challenge.new

    # get all challenges
    @pagy, @challenges = pagy(Challenge.includes(:tag, :employees), items: 5)

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
        challenge_success_response(format, @challenge, msg: 'Challenge was successfully created.')
      else
        challenge_failure_response(format, @challenge, status: :unprocessable_entity,
                                                       msg: 'Challenge was not successfully created.')
      end
    end
  end

  def upvote
    respond_to do |format|
      if @challenge.employee == current_employee
        challenge_failure_response(format, @challenge, status: :forbidden, msg: "You can't vote your own challenge.")
      elsif @challenge.votes.exists?(employee_id: current_employee.id)
        challenge_failure_response(format, @challenge, status: :forbidden, msg: "You can't vote more than once.")
      else
        @challenge.votes.create(employee_id: current_employee.id)
        challenge_success_response(format, @challenge, msg: 'Challenge was successfully upvoted.')
      end
    end
  end

  def collaborate
    respond_to do |format|
      if @challenge.employee == current_employee
        challenge_failure_response(format, @challenge, status: :forbidden,
                                                       msg: "You can't collaborate on your own challenge.")
      elsif @challenge.employees.exists?(employee_id: current_employee.employee_id)
        challenge_failure_response(format, @challenge, status: :forbidden,
                                                       msg: 'You are already collaborating on this challenge.')
      else
        @challenge.employees << current_employee
        challenge_success_response(format, @challenge, msg: 'You are successfully added to the collaborators list.')
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def challenge_params
    params.require(:challenge).permit(:title, :description, :tag_id)
  end

  def find_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_success_response(format, challenge, msg:)
    format.html { redirect_to challenges_path, notice: msg }
    format.json { render json: challenge, status: :created, location: challenge }
  end

  def challenge_failure_response(format, challenge, status:, msg:)
    format.html { redirect_to challenges_path, alert: msg }
    format.json { render json: challenge.errors, status: status, location: challenge }
  end
end
