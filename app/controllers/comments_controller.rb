class CommentsController < ApplicationController

  def create
    # @user = User.find_by(id: params[:user_id])
    @article = Article.find(params[:article_id])
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to article_path(id: @article.id)
    else
      @comment = Comment.new
      @article = Article.find(params[:article_id])
      @comments = current_user.comments
      render 'articles/show'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to article_path(params[:article_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :article_id)
  end

  def set_comment
    @comments = current_user.comments.find(params[:id])
  end
end
