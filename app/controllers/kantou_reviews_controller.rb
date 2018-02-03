class KantouReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :crete, :destroy] 
  before_action :correct_user, only: [:destroy] 
  
  def index
    @kantou = Kantou.find(params[:kantou_id])
    @kantou_reviews = @kantou.kantou_reviews.all.page(params[:page])
  end

  def new
    @kantou = Kantou.find(params[:kantou_id])
    @kantou_review = @kantou.kantou_reviews.new
  end

  def create
    @kantou = Kantou.find(params[:kantou_id])
    @kantou_review = @kantou.kantou_reviews.new(kantou_review_params)
    @kantou_review.user_id = current_user.id
    if @kantou_review.save
      flash[:success] = 'レビュー が正常に投稿されました'
      redirect_to kantou_kantou_reviews_path
    else
      flash.now[:danger] = 'レビュー が投稿されませんでした'
      render :new
    end
  end

  def destroy
    @kantou_review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_url)
  end

  private
  
  def set_kantou_review
    @kantou = Kantou.find(params[:kantou_id])
    @kantou_review = @kantou.kantou_reviews.find(params[:id])
  end
  # Strong Parameter
  def kantou_review_params
    params.require(:kantou_review).permit(:content, :evaluation)
  end
  
  def correct_user
    @kantou_review = current_user.kantou_reviews.find_by(id: params[:id])
    unless @kantou_review
      redirect_to root_path
    end
  end
end
