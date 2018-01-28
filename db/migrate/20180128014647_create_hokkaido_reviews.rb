class CreateHokkaidoReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :hokkaido_reviews do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :hokkaido, foreign_key: true
      t.integer :evaluation

      t.timestamps
    end
  end
end
