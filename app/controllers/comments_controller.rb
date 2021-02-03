# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authorized
  before_action :set_commentable

  def create
    @comment = Comment.new(comment_params)
    @comment.user = logged_in_user
    @comment.commentable = @commentable
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_commentable
    if params[:comment][:commentable_type] && params[:comment][:commentable_id]
      @commentable = params[:comment][:commentable_type].constantize.find(params[:comment][:commentable_id])
    end
  rescue StandardError => e
    render json: { error: e.message }
  end

  def comment_params
    params.require(:comment).permit(:content, :commentable_type, :commentable_id)
  end
end
