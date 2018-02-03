class KantousController < ApplicationController
  def index
    @kantous = Kantou.all.page(params[:page])
  end

  def show
    @kantou = Kantou.find(params[:id])
    @kantou_reviews = @kantou.kantou_reviews.order('created_at DESC').page(params[:page])
    counts(@kantou)
  end
end
