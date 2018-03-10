class TouhokusController < ApplicationController
  def index
    @touhokus = Touhoku.all.page(params[:page])
  end

  def show
    @touhoku = Touhoku.find(params[:id])
    @touhoku_reviews = @touhoku.touhoku_reviews.order('created_at DESC').page(params[:page])
    counts(@touhoku)
  end
  
  def counts(touhoku)
    @count_touhoku_reviews = touhoku.touhoku_reviews.count
  end
end