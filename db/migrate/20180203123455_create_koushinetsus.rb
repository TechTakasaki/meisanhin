class CreateKoushinetsus < ActiveRecord::Migration[5.0]
  def change
    create_table :koushinetsus do |t|
      t.string :content
      t.string :title
      t.string :image_url

      t.timestamps
    end
  end
end
