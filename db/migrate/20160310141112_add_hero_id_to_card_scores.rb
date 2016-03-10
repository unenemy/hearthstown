class AddHeroIdToCardScores < ActiveRecord::Migration
  def change
    add_column :card_scores, :hero_id, :integer
    add_index :card_scores, :hero_id
  end
end
