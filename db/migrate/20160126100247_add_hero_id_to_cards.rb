class AddHeroIdToCards < ActiveRecord::Migration
  def change
    add_column :cards, :hero_id, :integer
    add_index :cards, :hero_id
  end
end
