class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    if session[:current_user_id].is_a? Integer
       @user = User.find(session[:current_user_id])
    else
       @user = User.first
    end
  end

  def vote
    @vote = Vote.new(vote_params)

    if @vote.save
      flash[:notice] = 'You liked this article!'
      redirect_to root_path
    else
      flash[:notice] = @vote.errors.full_messages
      redirect_to root_path
    end
  end

  def unvote
    @vote = Vote.find_by(user_id: params[:user_id], article_id: params[:article_id])

    if @vote.destroy
      flash[:notice] = 'You disliked this article!'
      redirect_to root_path
    else
      flash[:notice] = @vote.errors.full_messages
      redirect_to root_path
    end
  end
  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
    @categories = Category.all
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
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

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
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

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :text, :image, :category_id)
    end

    def vote_params
      params.permit(:user_id, :article_id)
    end
end
