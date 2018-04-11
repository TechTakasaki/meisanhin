class SaninReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :crete, :destroy] 
  before_action :correct_user, only: [:destroy] 
  
  def index
    @sanin = Sanin.find(params[:sanin_id])
    @sanin_reviews = @sanin.sanin_reviews.all.page(params[:page])
  end

  def new
    @sanin = Sanin.find(params[:sanin_id])
    @sanin_review = @sanin.sanin_reviews.new
  end

  def create
    @sanin = Sanin.find(params[:sanin_id])
    @sanin_review = @sanin.sanin_reviews.new(sanin_review_params)
    @sanin_review.user_id = current_user.id
    if @sanin_review.save
      flash[:success] = 'レビュー が正常に投稿されました'
      redirect_to sanin_sanin_reviews_path
    else
      flash.now[:danger] = 'レビュー が投稿されませんでした'
      render :new
    end
  end

  def destroy
    @sanin_review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_url)
  end

  private
  
  def set_sanin_review
    @sanin = Sanin.find(params[:sanin_id])
    @sanin_review = @sanin.sanin_reviews.find(params[:id])
  end
  # Strong Parameter
  def sanin_review_params
    params.require(:sanin_review).permit(:content, :evaluation)
  end
  
  def correct_user
    @sanin_review = current_user.sanin_reviews.find_by(id: params[:id])
    unless @sanin_review
      redirect_to root_path
    end
  end
end
