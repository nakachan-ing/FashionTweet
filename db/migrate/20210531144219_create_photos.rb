class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :price_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
