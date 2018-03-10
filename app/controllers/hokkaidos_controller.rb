class HokkaidosController < ApplicationController
  
  def index
    @hokkaidos = Hokkaido.all.page(params[:page])
  end

  def show
    @hokkaido = Hokkaido.find(params[:id])
    @hokkaido_reviews = @hokkaido.hokkaido_reviews.order('created_at DESC').page(params[:page])
    counts(@hokkaido)
    @hokkaido_review = @hokkaido.hokkaido_reviews.order('created_at DESC').page(params[:page])
    averages(@hokkaido)
  end
  
  def counts(hokkaido)
    @count_hokkaido_reviews = hokkaido.hokkaido_reviews.count
  end
  
  def averages(hokkaido)
    @average_hokkaido_reviews = HokkaidoReview.group(:hokkaido_id).average(:evaluation)
  end
end
