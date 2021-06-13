class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_photo, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

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
    @photo_tags = @photo.photo_tags.order('created_at DESC')
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to photo_path(params[:id])
    else
      render :edit
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:snap, :title, :price_id, :description, { tag_ids: [] }).merge(user_id: current_user.id)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end


  def move_to_index
    redirect_to root_path and return unless user_signed_in?
    redirect_to root_path unless @photo.user == current_user
  end

end
