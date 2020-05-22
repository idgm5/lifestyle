class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all

    @categories = Category.all.sort_by(&:priority).reverse

    @user = if session[:current_user_id].is_a? Integer
              User.find(session[:current_user_id])
            else
              User.first
            end

    @main_article = @articles.sort_by { |article| article.votes.count }.reverse.first
    @second_article = @articles.sort_by { |article| article.votes.count }.reverse.second
    @third_article = @articles.sort_by { |article| article.votes.count }.reverse.third
  end

  def vote
    @vote = Vote.new(vote_params)

    if @vote.save
      flash[:notice] = 'You liked this article!'
      redirect_to "/collection?id=#{@vote.article.id}"
    else
      flash[:notice] = @vote.errors.full_messages
      redirect_to root_path
    end
  end

  def unvote
    @vote = Vote.find_by(user_id: params[:user_id], article_id: params[:article_id])
    @prev_vote = params[:article_id]

    if @vote.destroy
      flash[:notice] = 'You disliked this article!'
      redirect_to "/collection?id=#{@prev_vote}"
    else
      flash[:notice] = @vote.errors.full_messages
      redirect_to root_path
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show; end

  def collection
    @article = Article.find(params[:id])

    @collection = Article.where(category_id: @article.category_id)

    @user = if session[:current_user_id].is_a? Integer
              User.find(session[:current_user_id])
            else
              User.first
            end
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    current_user = User.find(session[:current_user_id])
    @article = current_user.articles.build(article_params)
    @article.image.attach(params[:article][:image])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :image, :category_id)
  end

  def vote_params
    params.permit(:user_id, :article_id)
  end
end
