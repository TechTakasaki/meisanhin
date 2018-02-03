class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(hokkaido)
    @count_hokkaido_reviews = hokkaido.hokkaido_reviews.count
  end
  
  def counts(touhoku)
    @count_touhoku_reviews = touhoku.touhoku_reviews.count
  end
  
  def counts(kantou)
    @count_kantou_reviews = kantou.kantou_reviews.count
  end
end