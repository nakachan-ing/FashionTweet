class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @photos = Photo.includes(:user).order('created_at DESC')
    @random = Photo.order("RAND()").limit(6)
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

  def show
    @photo = Photo.find(params[:id])
    @photo_tags = @photo.photo_tags.order('created_at DESC')
  end

  private

  def photo_params
    params.require(:photo).permit(:snap, :title, :price_id, :description, { tag_ids: [] }).merge(user_id: current_user.id)
  end
end
