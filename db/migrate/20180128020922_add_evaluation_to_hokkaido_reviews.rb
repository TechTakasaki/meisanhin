class AddEvaluationToHokkaidoReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :hokkaido_reviews, :evaluation, :integer
  end
end
