class SanyosController < ApplicationController
  def index
    @sanyos = Sanyo.all.page(params[:page])
  end

  def show
    @sanyo = Sanyo.find(params[:id])
    @sanyo_reviews = @sanyo.sanyo_reviews.order('created_at DESC').page(params[:page])
    counts(@sanyo)
    @sanyo_review = @sanyo.sanyo_reviews.order('created_at DESC').page(params[:page])
    averages(@sanyo)
  end
  
  def counts(sanyo)
    @count_sanyo_reviews = sanyo.sanyo_reviews.count
  end
  
  def averages(sanyo)
    @average_sanyo_reviews = SanyoReview.group(:sanyo_id).average(:evaluation)
  end
end
