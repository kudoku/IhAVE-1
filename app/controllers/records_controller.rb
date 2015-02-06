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
    @item.update_attribute(:is_out, true)
    
    @item.due_date = @item.records.last.date_due

    
    if @record.save
        if ApplicationHelper.date_set?(@item) && @record.borrower_email
          # binding.pry
          ReminderMailer.delay(run_at: @item.records.last.date_due - 2.days).reminder_email_borrower(@record)

        end
      flash[:success] = "Item #{@item.name} has been lent out."
      redirect_to location_items_path(@location)
    else
      render :new
    end
  end

  private

    def record_params
      params.require(:record).permit(:date_due, :borrower_name, :borrower_email)
    end
end
