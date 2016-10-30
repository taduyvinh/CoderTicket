class SessionsController < ApplicationController
  def create
    if @user = User.find_by_email(params[:email])
      if @user.authenticate(params[:password])
        session[:user_id]=@user.id
        flash[:success] = "Welcome, #{@user.name}"
        redirect_to root_path
      else
        flash.now[:error] = "Incorrect Password"
        render 'new'
      end
    else
        flash.now[:error]="User does not exist"
        render 'new'
    end
  end

  def destroy
    session[:user_id]=nil
    flash[:success] = "Logged out successfully"
    redirect_to root_path
  end
end
