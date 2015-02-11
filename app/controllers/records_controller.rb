class RecordsController < ApplicationController
  
  def index
    @records = Item.find(params[:item_id]).records
    if @records.last.item.is_out
      @display_borrower_name = @records.last.borrower_name
    else
      @display_borrower_name = "Noone!"
    end
  end

  def create
    @location = Location.find(params[:location_id])
    @item = Item.find(params[:item_id])
    @record = @item.records.build(record_params)
    
    

        if @record.save
          @item.update_attribute(:is_out, true)
          if !@record.borrower_email.empty? && @item.is_out

            ReminderMailer.delay(run_at: @item.records.last.date_due - 2.days).reminder_email_borrower(@record)
            ReminderMailer.reminder_email_borrower(@record).deliver

          end
          flash[:success] = "Item #{@item.name} has been lent out."
          redirect_to location_items_path(@location)
        else
          render 'items/_is_out_form.html.erb'
        end

    
  end

  private

    def record_params
      params.require(:record).permit(:date_due, :borrower_name, :borrower_email)
    end
end
