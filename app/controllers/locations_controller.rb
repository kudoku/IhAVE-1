class LocationsController < ApplicationController 
  before_action :authenticate_user!
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :set_item, ounly: [:show]

  def show
    # unless current_user.locations.include? @location
    #   redirect_to "http://foaas.com/linus/#{current_user.email}/IhAVE.com"
    # end
  end

  def index
    @locations = @user.locations.order('name ASC').page(params[:page])

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
      params.require(:item).permit(:title, :description, :is_out, :tag_list, :avatar)
    end
    
    def location_params
      params.require(:location).permit(:name, :description, :tag_list)
    end

end
