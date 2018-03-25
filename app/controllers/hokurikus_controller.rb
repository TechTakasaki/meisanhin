class HokurikusController < ApplicationController
  def index
    @hokurikus = Hokuriku.all.page(params[:page])
  end

  def show
    @hokuriku = Hokuriku.find(params[:id])
    @hokuriku_reviews = @hokuriku.hokuriku_reviews.order('created_at DESC').page(params[:page])
    counts(@hokuriku)
    @hokuriku_review = @hokuriku.hokuriku_reviews.order('created_at DESC').page(params[:page])
    averages(@hokuriku)
  end
  
  def counts(hokuriku)
    @count_hokuriku_reviews = hokuriku.hokuriku_reviews.count
  end
  
  def averages(hokuriku)
    @average_hokuriku_reviews = HokurikuReview.group(:hokuriku_id).average(:evaluation)
  end
end
