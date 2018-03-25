class SaninsController < ApplicationController
  def index
    @sanins = Sanin.all.page(params[:page])
  end

  def show
    @sanin = Sanin.find(params[:id])
    @sanin_reviews = @sanin.sanin_reviews.order('created_at DESC').page(params[:page])
    counts(@sanin)
    @sanin_review = @sanin.sanin_reviews.order('created_at DESC').page(params[:page])
    averages(@sanin)
  end
  
  def counts(sanin)
    @count_sanin_reviews = sanin.sanin_reviews.count
  end
  
  def averages(sanin)
    @average_sanin_reviews = SaninReview.group(:sanin_id).average(:evaluation)
  end
end
