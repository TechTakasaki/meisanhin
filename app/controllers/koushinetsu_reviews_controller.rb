class KoushinetsuReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :crete, :destroy] 
  before_action :correct_user, only: [:destroy] 
  
  def index
    @koushinetsu = Koushinetsu.find(params[:koushinetsu_id])
    @koushinetsu_reviews = @koushinetsu.koushinetsu_reviews.all.page(params[:page])
  end

  def new
    @koushinetsu = Koushinetsu.find(params[:koushinetsu_id])
    @koushinetsu_review = @koushinetsu.koushinetsu_reviews.new
  end

  def create
    @koushinetsu = Koushinetsu.find(params[:koushinetsu_id])
    @koushinetsu_review = @koushinetsu.koushinetsu_reviews.new(koushinetsu_review_params)
    @koushinetsu_review.user_id = current_user.id
    if @koushinetsu_review.save
      flash[:success] = 'レビュー が正常に投稿されました'
      redirect_to koushinetsu_koushinetsu_reviews_path
    else
      flash.now[:danger] = 'レビュー が投稿されませんでした'
      render :new
    end
  end

  def destroy
    @koushinetsu_review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_url)
  end

  private
  
  def set_koushinetsu_review
    @koushinetsu = Koushinetsu.find(params[:koushinetsu_id])
    @koushinetsu_review = @koushinetsu.koushinetsu_reviews.find(params[:id])
  end
  # Strong Parameter
  def koushinetsu_review_params
    params.require(:koushinetsu_review).permit(:content, :evaluation)
  end
  
  def correct_user
    @koushinetsu_review = current_user.koushinetsu_reviews.find_by(id: params[:id])
    unless @koushinetsu_review
      redirect_to root_path
    end
  end
end
