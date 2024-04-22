class SessionsController < ApplicationController
  def new
  end

  def create
    log = Login.find_by(email: params[:email])

    if log && log.authenticate(params[:password])
      session[:login_id] = log.id
      flash[:success] = "Welcome to data management system"
      redirect_to root_path
    else
      flash.now[:danger] = "Your email or password does not match"
      render 'new'
    end
  end

  def destroy
    session[:login_id] = nil
    flash[:success] = "logged out"
    redirect_to login_home_path
  end
end
