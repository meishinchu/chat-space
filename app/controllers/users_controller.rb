class UsersController < ApplicationController

  def edit
  end

  def update
    # binding.pry
    if current_user.name == params[:user][:name] && current_user.email == params[:user][:email]
      redirect_to "edit"
    else
      current_user.update(user_params)
      redirect_to "/"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
