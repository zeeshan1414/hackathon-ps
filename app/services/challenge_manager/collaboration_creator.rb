module ChallengeManager
  class CollaborationCreator < ApplicationService
    def initialize(challenge, employee)
      @challenge = challenge
      @current_employee = employee
    end
  
    def call
      if @challenge.employee == @current_employee
        @challenge.errors.add(:employee_id, "can't collaborate on own challenge")
      elsif Challenge.collaborated?(challenge_id: @challenge.id, employee_id: @current_employee.id)
        @challenge.errors.add(:employee_id, "already collaborating on this challenge")
      else
        @challenge.employees << @current_employee
        # Deliver the colloboration mail
        # ChallengeMailer.with(employee: @current_employee, challenge: @challenge).send_collaborate_email.deliver_later
      end
      @challenge
    end
  end  
end
