class ManagersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  def index
  end
  def new
    @manager = Manager.new
  end
  def create
    @manager = Manager.new(manager_params)
    if @manager.save
      #session[:user_id] = @manager.id
      flash[:success] = "Welcome to travel portal #{@manager.username}"
      redirect_to manager_path(@manager)
    else
      render 'new'
    end
  end
  def show
    #@user = User.find(params[:id])
  end
  def edit
    #@user = User.find(params[:id])
  end
  def update
    #@user = User.find(params[:id])
    if @manager.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to trips_path
    else
      render 'edit'
    end
  end
  
   private
    def manager_params
      params.require(:manager).permit(:username, :email, :password)
    end
    def set_user
      @manager = Manager.find(params[:id])
    end
    
  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "Access denied !"
      redirect_to root_path
    end
  end
end