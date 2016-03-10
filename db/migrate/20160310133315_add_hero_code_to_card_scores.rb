class AddHeroCodeToCardScores < ActiveRecord::Migration
  def change
    add_column :card_scores, :hero_code, :string
  end
end
