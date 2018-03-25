class CreateToukaiReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :toukai_reviews do |t|
      t.string :content
      t.integer :evaluation
      t.references :user, foreign_key: true
      t.references :toukai, foreign_key: true

      t.timestamps
    end
  end
end
