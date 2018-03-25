class KansaiReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :crete, :destroy, :edit, :update] 
  before_action :correct_user, only: [:destroy] 
  
  def index
    @kansai = Kansai.find(params[:kansai_id])
    @kansai_reviews = @kansai.kansai_reviews.all.page(params[:page])
  end

  def new
    @kansai = Kansai.find(params[:kansai_id])
    @kansai_review = @kansai.kansai_reviews.new
  end

  def create
    @kansai = Kansai.find(params[:kansai_id])
    @kansai_review = @kansai.kansai_reviews.new(kansai_review_params)
    @kansai_review.user_id = current_user.id
    if @kansai_review.save
      flash[:success] = 'レビュー が正常に投稿されました'
      redirect_to kansai_kansai_reviews_path
    else
      flash.now[:danger] = 'レビュー が投稿されませんでした'
      render :new
    end
  end

  def destroy
    @kansai_review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_url)
  end

  private
  
  def set_kansai_review
    @kansai = Kansai.find(params[:kansai_id])
    @kansai_review = @kansai.kansai_reviews.find(params[:id])
  end
  # Strong Parameter
  def kansai_review_params
    params.require(:kansai_review).permit(:content, :evaluation)
  end
  
  def correct_user
    @kansai_review = current_user.kansai_reviews.find_by(id: params[:id])
    unless @kansai_review
      redirect_to root_path
    end
  end
end
