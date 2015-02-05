class ReminderMailer < ActionMailer::Base
  default from: "thebest@youknowwho.com"


  def reminder_email_borrower(record)

    @record = record
    
    mail(to: @record.borrower_email, subject: "Friendly Reminder to Return #{@record.item.name} to #{@record.item.user.username}")
    
  end


  def reminder_email_user(item)

    @item = item

    mail(to: @item.user.email, subject: "Friendly Reminder to Return #{@item.name} to #{@item.records.last.borrower_name}")
  end
end