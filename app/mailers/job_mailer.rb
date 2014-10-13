class JobMailer < ActionMailer::Base
  layout 'new_job_mailer'

  default from: "SkillTra.de <jpholzmann@gmail.com>"


  def new_job_mail(user)


    $job_user_id = user.id
    $job_AR = User.find($job_user_id)


    mail to: $job_AR.email, subject: "We are good to go!"
  end
end