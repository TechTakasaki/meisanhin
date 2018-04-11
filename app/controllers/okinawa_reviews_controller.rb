class OkinawaReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :crete, :destroy] 
  before_action :correct_user, only: [:destroy] 
  
  def index
    @okinawa = Okinawa.find(params[:okinawa_id])
    @okinawa_reviews = @okinawa.okinawa_reviews.all.page(params[:page])
  end

  def new
    @okinawa = Okinawa.find(params[:okinawa_id])
    @okinawa_review = @okinawa.okinawa_reviews.new
  end

  def create
    @okinawa = Okinawa.find(params[:okinawa_id])
    @okinawa_review = @okinawa.okinawa_reviews.new(okinawa_review_params)
    @okinawa_review.user_id = current_user.id
    if @okinawa_review.save
      flash[:success] = 'レビュー が正常に投稿されました'
      redirect_to okinawa_okinawa_reviews_path
    else
      flash.now[:danger] = 'レビュー が投稿されませんでした'
      render :new
    end
  end

  def destroy
    @okinawa_review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_url)
  end

  private
  
  def set_okinawa_review
    @okinawa = Okinawa.find(params[:okinawa_id])
    @okinawa_review = @okinawa.okinawa_reviews.find(params[:id])
  end
  # Strong Parameter
  def okinawa_review_params
    params.require(:okinawa_review).permit(:content, :evaluation)
  end
  
  def correct_user
    @okinawa_review = current_user.okinawa_reviews.find_by(id: params[:id])
    unless @okinawa_review
      redirect_to root_path
    end
  end
end
