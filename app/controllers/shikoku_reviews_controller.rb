class ShikokuReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :crete, :destroy] 
  before_action :correct_user, only: [:destroy] 
  
  def index
    @shikoku = Shikoku.find(params[:shikoku_id])
    @shikoku_reviews = @shikoku.shikoku_reviews.all.page(params[:page])
  end

  def new
    @shikoku = Shikoku.find(params[:shikoku_id])
    @shikoku_review = @shikoku.shikoku_reviews.new
  end

  def create
    @shikoku = Shikoku.find(params[:shikoku_id])
    @shikoku_review = @shikoku.shikoku_reviews.new(shikoku_review_params)
    @shikoku_review.user_id = current_user.id
    if @shikoku_review.save
      flash[:success] = 'レビュー が正常に投稿されました'
      redirect_to shikoku_shikoku_reviews_path
    else
      flash.now[:danger] = 'レビュー が投稿されませんでした'
      render :new
    end
  end

  def destroy
    @shikoku_review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_url)
  end

  private
  
  def set_shikoku_review
    @shikoku = Shikoku.find(params[:shikoku_id])
    @shikoku_review = @shikoku.shikoku_reviews.find(params[:id])
  end
  # Strong Parameter
  def shikoku_review_params
    params.require(:shikoku_review).permit(:content, :evaluation)
  end
  
  def correct_user
    @shikoku_review = current_user.shikoku_reviews.find_by(id: params[:id])
    unless @shikoku_review
      redirect_to root_path
    end
  end
end
