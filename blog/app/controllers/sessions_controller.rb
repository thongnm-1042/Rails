class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      log_in user
      check_remember user
      remember user
      flash[:success] = t "layouts.application.login_success"
      redirect_back_or user
    else
      flash.now[:danger] = t "layouts.application.login_fail"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
