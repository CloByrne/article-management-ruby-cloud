class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # Define the index action for the articles controller
  def index
    # Retrieve all articles from the database
    @articles = Article.all
    # Render the articles as JSON
    render json: @articles
  end

  # Define the show action for the articles controller
  def show
    # Retrieve a single article by its id parameter
    @article = Article.find(params[:id])
    # Render the article as JSON
    render json: @article
  end

  # Define the create action for the articles controller
  def create
    # Create a new article from the parameters passed to the article_params method
    @article = Article.new(article_params)

    # If the article is successfully saved to the database
    if @article.save
      # Render the saved article as JSON with a status of :created
      render json: @article, status: :created
    else
      # Render the article's errors as JSON with a status of :unprocessable_entity
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # Define the update action for the articles controller
  def update
    # Retrieve a single article by its id parameter
    @article = Article.find(params[:id])

    # If the article is successfully updated with the parameters passed to the article_params method
    if @article.update(article_params)
      # Render the updated article as JSON
      render json: @article
    else
      # Render the article's errors as JSON with a status of :unprocessable_entity
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # Define the destroy action for the articles controller
  def destroy
    # Retrieve a single article by its id parameter
    @article = Article.find(params[:id])
    # Delete the article from the database
    @article.destroy
  end

  private
  # Define the article_params method to sanitize the parameters passed to the controller
  def article_params
    # Require the article parameter and permit the title, body, and published attributes
    params.require(:article).permit(:title, :body, :published)
  end
end
