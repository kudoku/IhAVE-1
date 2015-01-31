class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index]
  before_action :set_location
  before_action :set_item, only: [:show, :edit, :update, :destroy, :index]
  before_action :set_items, only: [:index]
  
  
  
  def index
    if params[:tag]
      @items = @item.tagged_with(params[:tag])
    else
     @item = @item
    end
    @user = User.find(@location.user_id)
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


  def create
      @item = @location.items.build(item_params)
      @item.user_id = @user.id
      if @item.save
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

      redirect_to location_item_path(@location, @item)
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
    # @results = Item.search_items(params[:q])
    @results = current_user.locations.find(params[:location_id]).items.search_items(params[:q]) 
    # binding.pry 
    respond_to do |format|
      format.html {redirect_to location_items_path(@location), :result => @results}
      format.js
    end
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
      params.require(:item).permit(:name, :description, :is_out, :date_due, :tag_list, :avatar, records_attributes: [:date_due, :borrower_name])
    end
end
