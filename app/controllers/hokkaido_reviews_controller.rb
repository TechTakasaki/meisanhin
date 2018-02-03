class HokkaidoReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :crete, :destroy, :edit, :update] 
  before_action :correct_user, only: [:destroy] 
  
  def index
    @hokkaido = Hokkaido.find(params[:hokkaido_id])
    @hokkaido_reviews = @hokkaido.hokkaido_reviews.all.page(params[:page])
  end

  def new
    @hokkaido = Hokkaido.find(params[:hokkaido_id])
    @hokkaido_review = @hokkaido.hokkaido_reviews.new
  end

  def create
    @hokkaido = Hokkaido.find(params[:hokkaido_id])
    @hokkaido_review = @hokkaido.hokkaido_reviews.new(hokkaido_review_params)
    @hokkaido_review.user_id = current_user.id
    if @hokkaido_review.save
      flash[:success] = 'レビュー が正常に投稿されました'
      redirect_to hokkaido_hokkaido_reviews_path
    else
      flash.now[:danger] = 'レビュー が投稿されませんでした'
      render :new
    end
  end

  def destroy
    @hokkaido_review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_url)
  end

  private
  
  def set_hokkaido_review
    @hokkaido = Hokkaido.find(params[:hokkaido_id])
    @hokkaido_review = @hokkaido.hokkaido_reviews.find(params[:id])
  end
  # Strong Parameter
  def hokkaido_review_params
    params.require(:hokkaido_review).permit(:content, :evaluation)
  end
  
  def correct_user
    @hokkaido_review = current_user.hokkaido_reviews.find_by(id: params[:id])
    unless @hokkaido_review
      redirect_to root_path
    end
  end
end