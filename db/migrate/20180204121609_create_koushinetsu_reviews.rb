class CreateKoushinetsuReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :koushinetsu_reviews do |t|
      t.string :content
      t.integer :evaluation
      t.references :user, foreign_key: true
      t.references :koushinetsu, foreign_key: true

      t.timestamps
    end
  end
end
