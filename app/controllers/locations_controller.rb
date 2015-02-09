class LocationsController < ApplicationController 
  before_action :authenticate_user!
  before_action :set_location, only: [:show, :edit, :update, :destroy,]
  before_action :set_user
  before_action :set_item, ounly: [:show]

  def show
  end

  def index
    @locations  = @user.locations.order('name ASC').page(params[:page])
    @user_items = current_user.items.page(params[:items_page])
    @cheked_out = @user_items.all.where(is_out: 'true').page(params[:checked_page])
    overdue   = @cheked_out.select { |item| item.records.last.date_due < Date.today }
    overdue_ids = overdue.map {|i| i.id}
    @overdue = Item.where(id: overdue_ids).page(params[:overdue_page])

    respond_to do |format|
      format.html 
      format.js 
    end
  end

  def new
    @location = Location.new
  end

  def create
      @location = current_user.locations.build(location_params)
      @location.user_id = @user.id
      if @location.save
        
        flash[:success] = "Location #{@location.name} added."
        redirect_to locations_path
      else
        render 'new'
      end
  end

  def edit
  end

  def update
    if @location.update_attributes(location_params)
      flash[:notice] = "Location #{@location.name} updated."
      redirect_to locations_path #it would redirect to locations_show, instead of locations_path
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    flash[:alert] = "Location #{@location.name} deleted."
    redirect_to locations_url
  end

  def search_submit
    
    respond_to do |format|
      format.js
    end
  end

  private

    def set_user 
       @user = current_user
    end 

    def set_item
      @item =  current_user.items.find_by(id: params[:id])
    end

    def set_location
     @location = current_user.locations.find_by(id: params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :is_out, :due_date, :tag_list, :avatar, records_attributes: [:date_due, :borrower_name])
    end
    
    def location_params
      params.require(:location).permit(:name, :description, :tag_list, :avatar)
    end

end
