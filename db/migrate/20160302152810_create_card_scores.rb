class CreateCardScores < ActiveRecord::Migration
  def change
    create_table :card_scores do |t|
      t.integer :tierlist_id
      t.index :tierlist_id
      t.integer :card_id
      t.index :card_id
      t.string :description
      t.integer :score

      t.timestamps null: false
    end
  end
end
