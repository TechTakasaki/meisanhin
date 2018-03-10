class KoushinetsusController < ApplicationController
  def index
    @koushinetsus = Koushinetsu.all.page(params[:page])
  end

  def show
    @koushinetsu = Koushinetsu.find(params[:id])
    @koushinetsu_reviews = @koushinetsu.koushinetsu_reviews.order('created_at DESC').page(params[:page])
    counts(@koushinetsu)
  end
  
  def counts(koushinetsu)
    @count_koushinetsu_reviews = koushinetsu.koushinetsu_reviews.count
  end
end
