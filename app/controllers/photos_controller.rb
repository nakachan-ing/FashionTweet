class PhotosController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @photo = Photo.new
    # @photo_tags = PhotoTag.new
  end

  def create
    # @photo_tag = PhotoTag.new(photo_params)
    @photo = Photo.create(photo_params)
    if @photo.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:snap, :title, :price_id, :description).merge(user_id: current_user.id)
  end

end
