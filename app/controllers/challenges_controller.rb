class ChallengesController < ApplicationController
  before_action :authenticate_employee!
  before_action :find_challenge, only: %w[upvote collaborate]

  def index
    # get all challenges
    @pagy, @challenges = pagy(Challenge.includes(:tag, :employees), items: 5)

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @challenges, status: :ok }
    end
  end

  def create
    @challenge = ChallengeManager::ChallengeCreator.call(challenge_params, current_employee)

    respond_to do |format|
      if @challenge.save
        challenge_success_response(format, @challenge, :created, msg: 'Challenge was successfully created.')
      else
        challenge_failure_response(format, @challenge, :unprocessable_entity, msg: @challenge.errors.full_messages)
      end
    end
  end

  def upvote
    @upvoted_challenge = ChallengeManager::VoteCreator.call(@challenge, current_employee)

    respond_to do |format|
      unless @upvoted_challenge.errors.any?
        challenge_success_response(format, @challenge, :created, msg: 'Challenge was upvoted successfully' )
      else
        challenge_failure_response(format, @challenge, :forbidden, msg: @upvoted_challenge.errors.full_messages.join(','))
      end
    end
  end

  def collaborate
    @collaborated_challenge = ChallengeManager::CollaborationCreator.call(@challenge, current_employee)

    respond_to do |format|
      unless @collaborated_challenge.errors.any?
        challenge_success_response(format, @challenge, :created, msg: 'Successfully added to the collaborators list')
      else
        challenge_failure_response(format, @challenge, :forbidden, msg: @collaborated_challenge.errors.full_messages.join(','))
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

  def challenge_success_response(format, challenge, status, msg:)
    format.html { redirect_back fallback_location: challenges_path, notice: msg }
    format.json { render json: challenge, status: status, location: challenge }
  end

  def challenge_failure_response(format, challenge, status, msg:)
    format.html { redirect_back fallback_location: challenges_path, alert: msg }
    format.json { render json: challenge.errors, status: status, location: challenge }
  end
end
