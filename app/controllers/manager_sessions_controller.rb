class ManagerSessionsController < ApplicationController
  def new
  end
  def create
    manager = Manager.find_by(email: params[:session][:email].downcase)
    if manager && manager.authenticate(params[:session][:password])
      session[:manager_id] = manager.id
      flash[:success] = "You have successfully logged in"
      redirect_to manager_path(manager)
    else
      flash.now[:danger] = "Invalid email or password"
      render 'new'
    end
  end
  def destroy
    session[:manager_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end
end