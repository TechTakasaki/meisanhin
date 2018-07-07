class OkinawasController < ApplicationController
  def index
    @okinawas = Okinawa.all.page(params[:page])
  end

  def show
    @okinawa = Okinawa.find(params[:id])
    @okinawa_reviews = @okinawa.okinawa_reviews.order('created_at DESC').page(params[:page])
    counts(@okinawa)
    @okinawa_review = @okinawa.okinawa_reviews.order('created_at DESC').page(params[:page])
    averages(@okinawa)
  end
  
  def counts(okinawa)
    @count_okinawa_reviews = okinawa.okinawa_reviews.count
  end
  
  def averages(okinawa)
    @average_okinawa_reviews = OkinawaReview.group(:okinawa_id).average(:evaluation)
  end
end
