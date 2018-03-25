class KansaisController < ApplicationController
  def index
    @kansais = Kansai.all.page(params[:page])
  end

  def show
    @kansai = Kansai.find(params[:id])
    @kansai_reviews = @kansai.kansai_reviews.order('created_at DESC').page(params[:page])
    counts(@kansai)
    @kansai_review = @kansai.kansai_reviews.order('created_at DESC').page(params[:page])
    averages(@kansai)
  end
  
  def counts(kansai)
    @count_kansai_reviews = kansai.kansai_reviews.count
  end
  
  def averages(kansai)
    @average_kansai_reviews = KansaiReview.group(:kansai_id).average(:evaluation)
  end
end
