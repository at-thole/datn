class CommentsController < ApplicationController
  before_action :load_comment, only: [:edit, :update, :destroy]
  before_action :load_travel_place, only: [:update, :destroy]

  def create
    @travel_place = TravelPlace.find_by id: comment_params[:travel_place_id]
    @comment = current_user.comments.build comment_params
    if @comment.save
      list_comments
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = "Comment not create"
      redirect_to :back
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @comment.update_attributes comment_params
      list_comments
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = "Comment not updated"
      redirect_to travel_place_path @travel_place.id
    end
  end

  def destroy
    if @comment.destroy
      list_comments
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = "Comment not delete"
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :travel_place_id
  end

  def list_comments
    @comments = @travel_place.comments
  end

  def load_travel_place
    @travel_place = TravelPlace.find_by id: @comment.travel_place_id
    unless @travel_place
      flash[:danger] = "TravelPlace not found"
      redirect_to :back
    end
  end

  def load_comment
    @comment = Comment.find_by id: params[:id]
    unless @comment
      flash[:danger] = "Comment not found"
      redirect_to :back
    end
  end
end
