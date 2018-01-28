class CreateHokkaidos < ActiveRecord::Migration[5.0]
  def change
    create_table :hokkaidos do |t|
      t.string :content
      t.string :title
      t.string :image_url

      t.timestamps
    end
  end
end
