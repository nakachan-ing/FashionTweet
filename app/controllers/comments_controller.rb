class CommentsController < ApplicationController
  before_action :set_comment, only: :destroy
  before_action :move_to_referer, only: :destroy

  def create
    comment = Comment.create(comment_params)
    redirect_to "/photos/#{comment.photo.id}"
  end

  def destroy
    @comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, photo_id: params[:photo_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def move_to_referer
    redirect_to request.referer and return unless user_signed_in?

    redirect_to request.referer unless @comment.user == current_user
  end
end
