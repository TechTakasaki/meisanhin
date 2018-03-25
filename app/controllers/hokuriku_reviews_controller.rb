class HokurikuReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :crete, :destroy, :edit, :update] 
  before_action :correct_user, only: [:destroy] 
  
  def index
    @hokuriku = Hokuriku.find(params[:hokuriku_id])
    @hokuriku_reviews = @hokuriku.hokuriku_reviews.all.page(params[:page])
  end

  def new
    @hokuriku = Hokuriku.find(params[:hokuriku_id])
    @hokuriku_review = @hokuriku.hokuriku_reviews.new
  end

  def create
    @hokuriku = Hokuriku.find(params[:hokuriku_id])
    @hokuriku_review = @hokuriku.hokuriku_reviews.new(hokuriku_review_params)
    @hokuriku_review.user_id = current_user.id
    if @hokuriku_review.save
      flash[:success] = 'レビュー が正常に投稿されました'
      redirect_to hokuriku_hokuriku_reviews_path
    else
      flash.now[:danger] = 'レビュー が投稿されませんでした'
      render :new
    end
  end

  def destroy
    @hokuriku_review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_url)
  end

  private
  
  def set_hokuriku_review
    @hokuriku = Hokuriku.find(params[:hokuriku_id])
    @hokuriku_review = @hokuriku.hokuriku_reviews.find(params[:id])
  end
  # Strong Parameter
  def hokuriku_review_params
    params.require(:hokuriku_review).permit(:content, :evaluation)
  end
  
  def correct_user
    @hokuriku_review = current_user.hokuriku_reviews.find_by(id: params[:id])
    unless @hokuriku_review
      redirect_to root_path
    end
  end
end
