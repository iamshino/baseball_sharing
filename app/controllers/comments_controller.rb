class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to article_path(id: @article.id)
    else
      @comment = Comment.new
      @comments = @article.comments
      render 'articles/show'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to article_path(params[:article_id])
    else
      render 'articles/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :article_id)
  end

  def set_comment
    @comments = current_user.comments.find(params[:id])
  end
end
