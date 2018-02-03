class CreateTouhokus < ActiveRecord::Migration[5.0]
  def change
    create_table :touhokus do |t|
      t.string :title
      t.string :content
      t.string :image_url

      t.timestamps
    end
  end
end
