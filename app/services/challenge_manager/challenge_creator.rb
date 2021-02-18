module ChallengeManager
  class ChallengeCreator < ApplicationService
    def initialize(challenge_params, current_employee)
      @challenge = Challenge.new(challenge_params)
      @current_employee = current_employee
    end
  
    def call
      @challenge.employee = @current_employee
      @challenge
    end
  end
end
