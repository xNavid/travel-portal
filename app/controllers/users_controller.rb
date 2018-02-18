class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  def index
    redirect_to login_path if !logged_in?
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to travel portal #{@user.username}"
      redirect_to trips_path
    else
      render 'new'
    end
  end
  def show
    # redirect to login if not signed in
    redirect_to login_path if !logged_in?
    #@user = User.find(params[:id])
  end
  def edit
    redirect_to login_path if !logged_in?
    #@user = User.find(params[:id])
  end
  def update
    #@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to trips_path
    else
      render 'edit'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
    def set_user
      @user = User.find(params[:id])
    end
end