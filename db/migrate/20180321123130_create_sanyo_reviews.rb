class CreateSanyoReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :sanyo_reviews do |t|
      t.string :content
      t.integer :evaluation
      t.references :user, foreign_key: true
      t.references :sanyo, foreign_key: true

      t.timestamps
    end
  end
end
