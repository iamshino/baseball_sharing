class MypageController < ApplicationController
  def show
    @articles = current_user.articles
    @articles = Article.all.page(params[:page])
  end
end
