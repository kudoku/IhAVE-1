class LocationsController < ApplicationController
  def show
    @location = current_user.locations.find_by(:id => params[:location_id])
    if @location
      # done, go to the show page
    else
      flash[:warning] = 'Invalid Location'
      redirect_to current_user
    end
  end

  def index
    @user = current_user
    @location = @user.locations
  end

  def new
  end

  def edit
  end

  def destroy
  end
end
