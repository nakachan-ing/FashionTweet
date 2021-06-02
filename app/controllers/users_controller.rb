class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      bypass_sign_in(current_user)
      redirect_to user_path(current_user.id)
    else
        render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :profile_image, :introduction)
  end
    
end
