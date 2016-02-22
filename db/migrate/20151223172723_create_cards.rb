class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.string :image_url
      t.string :card_id
      t.string :gold_image_url
      t.integer :card_type, default: 0
      t.integer :rarity
      t.index :card_type

      t.timestamps null: false
    end
  end
end
