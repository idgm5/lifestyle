class VotesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @vote = @article.votes.build(vote_params)

    if @vote.save
      flash[:notice] = 'You liked this article!'
      redirect_to "/collection?id=#{@vote.article.id}"
    else
      flash[:notice] = @vote.errors.full_messages
      redirect_to root_path
    end
  end

  def destroy
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

  private

  def vote_params
    params.permit(:user_id, :article_id)
  end
end
