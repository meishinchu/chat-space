class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.name == params[:user][:name] && current_user.email == params[:user][:email]
      render "edit"
    else
      current_user.update(user_params)
      render "messages/index.html.haml"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
