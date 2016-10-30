class UsersController < ApplicationController
  def new
    @users=User.new
  end 

  def create
    @user=User.new(user_params)
      if @user.save
        flash[:success] = "User created Successfully"
        redirect_to root_path
      else
        flash[:error]="#{@user.errors.full_messages.to_sentence}"
        render 'new'
      end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
