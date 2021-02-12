module ChallengeManager
  class VoteCreator < ApplicationService
    def initialize(challenge, employee)
      @challenge = challenge
      @current_employee = employee
    end
  
    def call
      if @challenge.employee == @current_employee
        @challenge.errors.add(:employee_id, "can't vote on own challenge")
      elsif Challenge.voted?(challenge_id: @challenge.id, employee_id: @current_employee.id)
        @challenge.errors.add(:employee_id, "can't vote more than once")
      else
        Vote.create(challenge: @challenge, employee: @current_employee)
        # Deliver the upvote mail
        # ChallengeMailer.with(employee: @current_employee, challenge: @challenge).send_upvote_email.deliver_later
      end
      @challenge
    end
  end  
end
