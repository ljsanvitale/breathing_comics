class Admin::CommentsController < Admin::BaseController
  include CommentsHelper
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.save
    redirect_to admin_article_path(@comment.article)
  end
end
