class CreateTouhokuReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :touhoku_reviews do |t|
      t.string :content
      t.string :evaluation
      t.references :user, foreign_key: true
      t.references :touhoku, foreign_key: true

      t.timestamps
    end
  end
end
