class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :set_location
  
  def show
  end

  def new
    @item = @user.items.build
    @item.user_id = @user.id
  end

  def create
    @item = @location.item.build(item_params)
    if @task.save
      flash[:success] = "Item #{@item.name} added."
      redirect_to user_task_path(@user, @item)
    else
      render 'new'
    end
  end

  def update
    if @task.update_attributes(item_params)
      redirect_to location_item_path(@location)
    else
      flash[:danger] = "Item creation faild"
      render 'edit'
    end
  end

  def destroy
    @task.delete
    redirect_to 
    end




  private 
  

  private

    def set_user
      @user = current_user
    end

    def set_item
      @item =  Item.find_by(id: params[:id], user_id: current_user)    
      # unless current_user.locations.include? @location
      @items =  Item.find_by(user_id: current_user)
    end

    def set_location
      @location = Location.find(params[:location_id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :is_out, :date_due)
    end

end
