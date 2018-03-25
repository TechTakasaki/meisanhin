class SanyoReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :crete, :destroy] 
  before_action :correct_user, only: [:destroy] 
  
  def index
    @sanyo = Sanyo.find(params[:sanyo_id])
    @sanyo_reviews = @sanyo.sanyo_reviews.all.page(params[:page])
  end

  def new
    @sanyo = Sanyo.find(params[:sanyo_id])
    @sanyo_review = @sanyo.sanyo_reviews.new
  end

  def create
    @sanyo = Sanyo.find(params[:sanyo_id])
    @sanyo_review = @sanyo.sanyo_reviews.new(sanyo_review_params)
    @sanyo_review.user_id = current_user.id
    if @sanyo_review.save
      flash[:success] = 'レビュー が正常に投稿されました'
      redirect_to sanyo_sanyo_reviews_path
    else
      flash.now[:danger] = 'レビュー が投稿されませんでした'
      render :new
    end
  end

  def destroy
    @sanyo_review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_url)
  end

  private
  
  def set_sanyo_review
    @sanyo = Sanyo.find(params[:sanyo_id])
    @sanyo_review = @sanyo.sanyo_reviews.find(params[:id])
  end
  # Strong Parameter
  def sanyo_review_params
    params.require(:sanyo_review).permit(:content, :evaluation)
  end
  
  def correct_user
    @sanyo_review = current_user.sanyo_reviews.find_by(id: params[:id])
    unless @sanyo_review
      redirect_to root_path
    end
  end
end
