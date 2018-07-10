class CommentsController < ApplicationController
  def index
    comments = nil
    if params[:user_id]
      comments = User.find(params[:user_id]).comments
    elsif params[:artwork_id]
      comments = Artwork.find(params[:artwork_id]).comments
    else
      comments = Comment.all  
    end
    
    if comments
      render json: comments
    else
      render json: comments.errors.full_messages, status: 404
    end
  end
  
  def create
    comment = Comment.new(comment_params)
    if comment
      render json: comment, status: 201
    else
      render json: comment.errors.full_messages, status: 422
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment
      render json: comment
    else
      render json: comment.errors.full_messages, status: 404
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :artwork_id)
  end
end