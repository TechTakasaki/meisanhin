class KantousController < ApplicationController
  def index
    @kantous = Kantou.all.page(params[:page])
  end

  def show
    @kantou = Kantou.find(params[:id])
    @kantou_reviews = @kantou.kantou_reviews.order('created_at DESC').page(params[:page])
    counts(@kantou)
    @kantou_review = @kantou.kantou_reviews.order('created_at DESC').page(params[:page])
    averages(@kantou)
  end
  
  def counts(kantou)
    @count_kantou_reviews = kantou.kantou_reviews.count
  end
  
  def averages(hokkaido)
    @average_kantou_reviews = KantouReview.group(:kantou_id).average(:evaluation)
  end
end