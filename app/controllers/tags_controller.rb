class TagsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    session[:previous_url] = request.referer
    @tag = Tag.new
  end

  def create
    @session = session[:previous_url]
    @tag = Tag.create(tag_params)
    if @tag.save
      redirect_to @session
    else
      render :new
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
