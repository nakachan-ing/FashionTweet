class PhotosController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @photos = Photo.all.order(created_at: :desc)
  end

  def new
    @photo = Photo.new
    @photo.photo_tags.build
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.valid?
      @photo.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:snap, :title, :price_id, :description, { tag_ids: [] }).merge(user_id: current_user.id)
  end
end
