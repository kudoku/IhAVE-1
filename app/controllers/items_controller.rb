class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle_is_completed]
  before_action :set_user
  before_action :set_location
  def new
    @item = @user.items.build
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
      redirect_to user_tasks_path
    else
      flash[:danger] = "Item creation faild"
      render 'edit'
    end

  def update
    
  end

  def destroy
    @task.delete
    redirect_to user_tasks_path
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
      params.require(:item).permit(:name, :description, :is_out, :date_due)
    end

end
