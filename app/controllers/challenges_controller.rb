class ChallengesController < ApplicationController
  before_action :authenticate_employee!

  def index
    @challenges = Challenge.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @challenges }
    end
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.employee = current_employee

    if @challenge.save
      format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
      format.json { render json: @challenge, status: :created, location: @challenge }
    else
      format.html { redirect_to challenges_url, alert: 'Challenge was not successfully created.' }
      format.json { render json: @challenge.errors, status: :unprocessable_entity }
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def challenge_params
    params.require(:challenge).permit(:title, :description)
  end
end
