class KyushusController < ApplicationController
  def index
    @kyushus = kyushu.all.page(params[:page])
  end

  def show
    @kyushu = kyushu.find(params[:id])
    @kyushu_reviews = @kyushu.kyushu_reviews.order('created_at DESC').page(params[:page])
    counts(@kyushu)
    @kyushu_review = @kyushu.kyushu_reviews.order('created_at DESC').page(params[:page])
    averages(@kyushu)
  end
  
  def counts(kyushu)
    @count_kyushu_reviews = kyushu.kyushu_reviews.count
  end
  
  def averages(kyushu)
    @average_kyushu_reviews = KyushuReview.group(:kyushu_id).average(:evaluation)
  end
end