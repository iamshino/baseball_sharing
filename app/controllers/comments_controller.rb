class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comments = current_user.comments.new(comment_params)
    @comments.article_id = @article.id
    @comments.save
    redirect_to article_path(@article)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to article_path(params[:article_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def set_comment
    @comments = current_user.comments.find(params[:id])
  end
end
