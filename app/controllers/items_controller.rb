class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index]
  before_action :set_location, except: [:return_item, :lend_item]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :index]
  before_action :set_items
  
  
  
  def index
    if params[:tag]
      @items = current_user.items.tagged_with(params[:tag])

    else
     @items = @items

    end
    @user = current_user
  end

  def show
    respond_to do |format|
      format.html 
      format.js
      end
  end

  def new
    @item = @user.items.build
    @record = @item.records.build
  end

  def edit
    respond_to do |format|
      format.js 
    end

  end


  def create
      @item = @location.items.build(item_params)
      @item.user_id = @user.id
      if @item.save
        if ApplicationHelper.date_set?(@item)
          # ReminderMailer.reminder_email(@user, @item).deliver
          ReminderMailer.delay(run_at: @item.records.last.date_due - 2.days).reminder_email(@user, @item)
        end
        respond_to do |format|
          format.html { redirect_to location_items_path(@location) }
          format.js
          end
        flash[:success] = "Item #{@item.name} added."
          else
          flash[:error] = @item.errors.full_messages
        render 'new'
      end
    end

  def update
    if @item.update_attributes(item_params)

      redirect_to location_items_path(@location)
    else
      flash[:danger] = "Item creation failed"
      render :edit
    end
  end

  def destroy
    @item.destroy
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
    @item = Item.find(params[:item_id])
    @location = Location.find(@item.location_id)
    
    @item.update_attribute(:is_out, false)
    respond_to do |format|
      format.js {  }
    end
  end

  def lend_item
    @item = Item.find(params[:item_id])

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
      @item =  Item.find_by(id: params[:id], user_id: current_user)
    end

    def item_params
      params.require(:item).permit(:name, :description, :quantity, :price, :is_out, :date_due, :tag_list, :avatar, records_attributes: [:date_due, :borrower_name])
    end
end
