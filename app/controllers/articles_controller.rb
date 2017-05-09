class ArticlesController < ApplicationController
  before_action :articles_params, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(articles_params)
    @article.save
    redirect_to articles_path
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def articles_params
    params.require(:article).permit(:title, :content);
  end
end
