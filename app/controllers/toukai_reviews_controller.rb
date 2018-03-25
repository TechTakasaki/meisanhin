class ToukaiReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :crete, :destroy] 
  before_action :correct_user, only: [:destroy]
  
  def index
    @toukai = Toukai.find(params[:toukai_id])
    @toukai_reviews = @toukai.toukai_reviews.all.page(params[:page])
  end

  def new
    @toukai = Toukai.find(params[:touhoku_id])
    @toukai_review = @toukai.toukai_reviews.new
  end

  def create
    @toukai = Toukai.find(params[:touhoku_id])
    @toukai_review = @toukai.toukai_reviews.new(touhoku_review_params)
    @toukai_review.user_id = current_user.id
    if @toukai_review.save
      flash[:success] = 'レビュー が正常に投稿されました'
      redirect_to toukai_toukai_reviews_path
    else
      flash.now[:danger] = 'レビュー が投稿されませんでした'
      render :new
    end
  end

  def destroy
    @toukai_review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_url)
  end

  private
  
  def set_toukai_review
    @toukai = Toukai.find(params[:toukai_id])
    @toukai_review = @toukai.toukai_reviews.find(params[:id])
  end
  # Strong Parameter
  def toukai_review_params
    params.require(:toukai_review).permit(:content, :evaluation)
  end
  
  def correct_user
    @toukai_review = current_user.toukai_reviews.find_by(id: params[:id])
    unless @toukai_review
      redirect_to root_path
    end
  end
end
