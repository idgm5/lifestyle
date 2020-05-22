class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to new_article_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Category was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end

  def vote_params
    params.permit(:user_id, :article_id)
  end
end
