class ReminderMailer < ActionMailer::Base
  default from: "thebest@youknowwho.com"


  def reminder_email(user, item)
    @user = user
    @item = item

    mail(to: @user.email, subject: 'yooooo')
    
  end
end