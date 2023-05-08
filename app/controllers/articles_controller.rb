class ArticlesController < ApplicationController
    def index
      # Retrieve all articles from the database
      @articles = Article.all
      # Render the articles as JSON
      render json: @articles
    end
  
    def show
      # Retrieve a single article by its id parameter
      @article = Article.find(params[:id])
      # Render the article as JSON
      render json: @article
    end
  
    def create
      # Create a new article from the parameters passed to the article_params method
      @article = Article.new(article_params)
  
      if @article.save
        # Render the saved article as JSON with a status of :created
        render json: @article, status: :created
      else
        # Render the article's errors as JSON with a status of :unprocessable_entity
        render json: @article.errors, status: :unprocessable_entity
      end
    end
  
    def update
      # Retrieve a single article by its id parameter
      @article = Article.find(params[:id])
  
      if @article.update(article_params)
        # Render the updated article as JSON
        render json: @article
      else
        # Render the article's errors as JSON with a status of :unprocessable_entity
        render json: @article.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      # Retrieve a single article by its id parameter
      @article = Article.find(params[:id])
      # Delete the article from the database
      @article.destroy
    end
  
    private
  
    def article_params
      params.require(:article).permit(:title, :body, :published)
    end
  end
  