class ToukaisController < ApplicationController
  def index
    @toukais = Toukai.all.page(params[:page])
  end

  def show
    @toukai = Toukai.find(params[:id])
    @toukai_reviews = @toukai.toukai_reviews.order('created_at DESC').page(params[:page])
    counts(@toukai)
    @toukai_review = @toukai.toukai_reviews.order('created_at DESC').page(params[:page])
    averages(@toukai)
  end
  
  def counts(toukai)
    @count_toukai_reviews = toukai.toukai_reviews.count
  end
  
  def averages(toukai)
    @average_toukai_reviews = ToukaiReview.group(:toukai_id).average(:evaluation)
  end
end