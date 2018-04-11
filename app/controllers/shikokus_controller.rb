class ShikokusController < ApplicationController
  def index
    @shikokus = Shikoku.all.page(params[:page])
  end

  def show
    @shikoku = Shikoku.find(params[:id])
    @shikoku_reviews = @shikoku.shikoku_reviews.order('created_at DESC').page(params[:page])
    counts(@shikoku)
    @shikoku_review = @shikoku.shikoku_reviews.order('created_at DESC').page(params[:page])
    averages(@shikoku)
  end
  
  def counts(shikoku)
    @count_shikoku_reviews = shikoku.shikoku_reviews.count
  end
  
  def averages(shikoku)
    @average_shikoku_reviews = ShikokuReview.group(:shikoku_id).average(:evaluation)
  end
end