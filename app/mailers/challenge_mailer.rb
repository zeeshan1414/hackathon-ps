class ChallengeMailer < ApplicationMailer
  default from: "notifications@hackathon.com"

  def send_collaborate_email
    @challenge = params[:challenge]
    @recipient = @challenge.employee
    @sender = params[:employee]
    mail(to: @recipient.email, subject: "#{@sender.first_name} is collaborating on your challenge '#{@challenge.title}'")
  end

  def send_upvote_email
    @challenge = params[:challenge]
    @recipient = @challenge.employee
    @sender = params[:employee]
    mail(to: @recipient.email, subject: "#{@sender.first_name} has upvoted your challenge '#{@challenge.title}'")
  end
end
