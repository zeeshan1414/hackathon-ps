# Preview all emails at http://localhost:3000/rails/mailers/challenge_mailer
class ChallengeMailerPreview < ActionMailer::Preview
  def challenge_mailer_preview
    ChallengeMailer.with(employee: Employee.last, challenge: Challenge.first).send_collaborate_email
  end
end
