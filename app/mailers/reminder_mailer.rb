class ReminderMailer < ActionMailer::Base
  default from: "park.joonw@gmail.com"


  def reminder_email_borrower(record)

    @record = record
    
    mail(from: @record.item.user.email, to: @record.borrower_email, subject: "Friendly Reminder to Return #{@record.item.name} to #{@record.item.user.username}")
    
  end


  def reminder_email_user(item)

    @item = item

    mail(from: @item.user.email, to: @item.user.email, subject: "Friendly Reminder to Return #{@item.name} to #{@item.borrowed_from}")
  end
end