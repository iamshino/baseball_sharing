class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_article, only: %i[ edit update destroy ]

  # GET /articles or /articles.json
  def index
    articles = Article.all
    articles = articles.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
    @articles = articles.page params[:page]
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = current_user.articles.new(article_params)

    # respond_to do |format|
      if @article.save!
        redirect_to @article, notice: "記事を投稿しました"
      else
        render :new, status: :unprocessable_entity
      end
    # end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    # respond_to do |format|
      if @article.update!(article_params)
        redirect_to article_url(@article), notice: "記事を更新しました"
      else
        render :edit, status: :unprocessable_entity
      end
    # end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    # respond_to do |format|
      redirect_to articles_url, notice: "記事を削除しました"
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, tag_ids:[])
    end
end
