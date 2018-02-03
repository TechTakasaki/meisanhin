class HokkaidosController < ApplicationController
  
  def index
    @hokkaidos = Hokkaido.all.page(params[:page])
  end

  def show
    @hokkaido = Hokkaido.find(params[:id])
    @hokkaido_reviews = @hokkaido.hokkaido_reviews.order('created_at DESC').page(params[:page])
    counts(@hokkaido)
  end
end
