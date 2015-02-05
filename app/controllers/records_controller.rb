class RecordsController < ApplicationController
  
  def index
    @records = Item.find(params[:item_id]).records
    if @records.last.item.is_out
      @display_borrower_name = @records.last.item.user.username
    else
      @display_borrower_name = nil
    end
  end

  def create
    @location = Location.find(params[:location_id])
    @item = Item.find(params[:item_id])
    @record = @item.records.build(record_params)
    @item.update_attribute(:is_out, true)
    
    @item.due_date = @item.records.last.date_due

    
    if @record.save
      flash[:success] = "Item #{@item.name} has been lent out."
      redirect_to location_items_path(@location)
    else
      render :new
    end
  end

  private

    def record_params
      params.require(:record).permit(:date_due, :borrower_name)
    end
end
