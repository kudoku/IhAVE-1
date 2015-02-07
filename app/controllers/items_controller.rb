class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index]
  before_action :set_location, except: [:return_item]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :index]
  before_action :set_items, except: [:return_item]
  
  def index
    if params[:tag]
      @items = current_user.items.tagged_with(params[:tag])
    end
    @user = current_user
  end

  def show
    @record = @item.records.build
    respond_to do |format|
      format.html 
      format.js
      end
  end

  def new
    @item = @user.items.build
    @record = @item.records.build
    # @item.due_date = @item.records.last.date_due
  end

  def edit
    respond_to do |format|
      format.js 
    end

  end


  def create
      @item = @location.items.new(item_params)
      
      @item.user_id = @user.id
      

      if @item.save        
        if @item.is_borrowed && @item.due_date
          
          ReminderMailer.delay(run_at: @item.due_date - 2.days).reminder_email_user(@item)
          
        end
        # binding.pry
        respond_to do |format|
          format.html { redirect_to location_items_path(@location) }
          format.js
        end
        flash[:success] = "Item #{@item.name} added."
      else
        flash[:error] = "#{@item.errors.full_messages}"
        render 'new'
      end
    end

  def update
    if @item.update_attributes(item_params)

      redirect_to location_items_path(@location)
    else
      flash[:danger] = "Item creation failed"
       redirect_to location_items_path(@location)
    end
  end

  def destroy
    
    @item.destroy
    unless @item.is_borrowed
      flash[:notice] = "Item #{@item.name} deleted."
    else
      flash[:notice] = "Item #{@item.name} has been returned to #{@item.borrowed_from}"
    end
    redirect_to location_items_path(@location)
  end

  def search_submit
    @results = current_user.locations.find(params[:location_id]).items.search_items(params[:q]) 
    respond_to do |format|
      format.html {redirect_to location_items_path(@location), :result => @results}
      format.js
    end
  end

  def return_item
    @item = current_user.items.find(params[:item_id])
    @location = current_user.locations.find(@item.location_id)

    
    @item.update_attribute(:is_out, false)
    @item.records.last.update_attribute(:date_returned, Date.today)
    respond_to do |format|
      format.js { @record = @item.records.build }
    end
  end

  def show_records
    @item = Item.find(params[:item_id])
    @record = @item.records.build
    # @location = Location.find(@item.location_id)
    # binding.pry
  end
 
  private

    def set_user
      @user = current_user
    end

    def set_location
      @location = current_user.locations.find(params[:location_id])
    end

    def set_items
      @items =  @location.items
    end

    def set_item
      @item =  current_user.items.find_by(id: params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :quantity, :price, :is_out, :due_date, :borrowed_from, :is_borrowed, :tag_list, :avatar, records_attributes: [:borrower_name, :date_due])
    end
end
