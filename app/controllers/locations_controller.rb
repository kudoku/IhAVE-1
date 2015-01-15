class LocationsController < ApplicationController 
  before_action :authenticate_user!
  def show
    @locations = current_user.locations.find_by(:id => params[:location_id])
  end

  def index
    @location = @user.locations
  end

  def new
  end

  def edit
  end

  def destroy
  end

  private

    def set_user 
       @user = current_user
    end 


    def set_item
      @item =  Item.find_by(id: params[:id], user_id: current_user)    
    end

    def set_location
     @locations = current_user.locations.find_by(:id => params[:location_id])
    end

    def item_params
      params.require(:item).permit(:title, :description, :is_out)
    end
    
    def location_params
      params.require(:loacation).permit(:title, :description)
    end

end
