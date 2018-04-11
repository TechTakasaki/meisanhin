class KyushuReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :crete, :destroy] 
  before_action :correct_user, only: [:destroy] 
  
  def index
    @kyushu = Kyushu.find(params[:kyushu_id])
    @kyushu_reviews = @kyushu.kyushu_reviews.all.page(params[:page])
  end

  def new
    @kyushu = Kyushu.find(params[:kyushu_id])
    @kyushu_review = @kyushu.kyushu_reviews.new
  end

  def create
    @kyushu = Kyushu.find(params[:kyushu_id])
    @kyushu_review = @kyushu.kyushu_reviews.new(kyushu_review_params)
    @kyushu_review.user_id = current_user.id
    if @kyushu_review.save
      flash[:success] = 'レビュー が正常に投稿されました'
      redirect_to kyushu_kyushu_reviews_path
    else
      flash.now[:danger] = 'レビュー が投稿されませんでした'
      render :new
    end
  end

  def destroy
    @kyushu_review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_url)
  end

  private
  
  def set_kyushu_review
    @kyushu = Kyushu.find(params[:kyushu_id])
    @kyushu_review = @kyushu.kyushu_reviews.find(params[:id])
  end
  # Strong Parameter
  def kyushu_review_params
    params.require(:kyushu_review).permit(:content, :evaluation)
  end
  
  def correct_user
    @kyushu_review = current_user.kyushu_reviews.find_by(id: params[:id])
    unless @kyushu_review
      redirect_to root_path
    end
  end
end
