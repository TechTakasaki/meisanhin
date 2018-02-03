class TouhokuReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :crete, :destroy] 
  before_action :correct_user, only: [:destroy] 
  
  def index
    @touhoku = Touhoku.find(params[:touhoku_id])
    @touhoku_reviews = @touhoku.touhoku_reviews.all.page(params[:page])
  end

  def new
    @touhoku = Touhoku.find(params[:touhoku_id])
    @touhoku_review = @touhoku.touhoku_reviews.new
  end

  def create
    @touhoku = Touhoku.find(params[:touhoku_id])
    @touhoku_review = @touhoku.touhoku_reviews.new(touhoku_review_params)
    @touhoku_review.user_id = current_user.id
    if @touhoku_review.save
      flash[:success] = 'レビュー が正常に投稿されました'
      redirect_to touhoku_touhoku_reviews_path
    else
      flash.now[:danger] = 'レビュー が投稿されませんでした'
      render :new
    end
  end

  def destroy
    @touhoku_review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_url)
  end

  private
  
  def set_touhoku_review
    @touhoku = Touhoku.find(params[:touhoku_id])
    @touhoku_review = @touhoku.touhoku_reviews.find(params[:id])
  end
  # Strong Parameter
  def touhoku_review_params
    params.require(:touhoku_review).permit(:content, :evaluation)
  end
  
  def correct_user
    @touhoku_review = current_user.touhoku_reviews.find_by(id: params[:id])
    unless @touhoku_review
      redirect_to root_path
    end
  end
end
