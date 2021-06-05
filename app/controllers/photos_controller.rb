class PhotosController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @photo = PhotoTagRelation.new
  end

  def create
    @photo = PhotoTagRelation.new(photo_params)
    if @photo.valid?
      @photo.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private
  def photo_params
    params.require(:photo_tag_relation).permit(:snap, :title, :price_id, :description, :tag_id)
  end

end
