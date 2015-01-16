class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle_is_completed]
  before_action :set_user

  def new
    
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end




  private 
  def show
    @items =  Item.find_by(user_id: current_user)
  end

  private

    def set_user
      @user = current_user
    end

    def set_item
      @item =  Item.find_by(id: params[:id], user_id: current_user)    
    end

    def set_location
      @location = Location.find(params[:location_id])
    end

    def item_params
      params.require(:itm).permit(:title, :description, :is_out)
    end

end
