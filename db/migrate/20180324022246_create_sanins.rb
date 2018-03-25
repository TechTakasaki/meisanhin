class CreateSanins < ActiveRecord::Migration[5.0]
  def change
    create_table :sanins do |t|
      t.string :content
      t.string :title
      t.string :image_url
      t.float :latitude
      t.float :longitude
      t.string :hp_url
      t.string :maker

      t.timestamps
    end
  end
end
