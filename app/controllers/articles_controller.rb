class ArticlesController < ApplicationController
  load_and_authorize_resource

  def show
    # @article is already loaded and authorized
    @article = Article.find(params[:id])
    authorize! :read, @article
  end

  def create
    if @article.save
      # hurray
    else
      render :new
    end
  end

  private

  def my_sanitizer
    params.require(:article).permit(:name)
  end
end
