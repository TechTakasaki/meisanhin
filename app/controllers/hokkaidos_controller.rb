class HokkaidosController < ApplicationController
  
  def index
    @hokkaidos = Hokkaido.all.page(params[:page])
  end

  def show
    @hokkaido = Hokkaido.find(params[:id])
  end
end
