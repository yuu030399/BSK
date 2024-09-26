class Admin::CommentsController < ApplicationController
  def index
    @review_comments = Comment.all
  end

  def destroy
    @review_comment = Comment.find(params[:id])
    @review_comment.destroy
    redirect_to admin_comments_path
  end
end
