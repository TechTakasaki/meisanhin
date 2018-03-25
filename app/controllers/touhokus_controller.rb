class TouhokusController < ApplicationController
  def index
    @touhokus = Touhoku.all.page(params[:page])
  end

  def show
    @touhoku = Touhoku.find(params[:id])
    @touhoku_reviews = @touhoku.touhoku_reviews.order('created_at DESC').page(params[:page])
    counts(@touhoku)
    @touhoku_review = @touhoku.touhoku_reviews.order('created_at DESC').page(params[:page])
    averages(@touhoku)
  end
  
  def counts(touhoku)
    @count_touhoku_reviews = touhoku.touhoku_reviews.count
  end
  
  def averages(touhoku)
    @average_touhoku_reviews = TouhokuReview.group(:touhoku_id).average(:evaluation)
  end
end