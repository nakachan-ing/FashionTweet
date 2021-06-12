class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def show
    @photos = @user.photos.order('created_at DESC')
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

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_index
    redirect_to root_path and return unless user_signed_in?

    redirect_to root_path unless @user == current_user
  end
end
