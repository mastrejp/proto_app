class ArticlesController < ApplicationController
  before_action :build_article, only: [:index, :create]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def create
    @article.save!
    redirect_to root_path, notice: 'Yeah! Thanks a lot :D'
  rescue
    flash.now[:errors] = 'Problem has occured... Try again.'
    render :index
  end

  private

  def build_article
    @article = Article.new(article_params)
  end

  def article_params
    params.require(:article).permit(:content) if params[:article]
  end
end
