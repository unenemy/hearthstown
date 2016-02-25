class Card < ActiveRecord::Base
  enum rarity: { common: 1, rare: 2, epic: 3, legendary: 4 }
  belongs_to :hero
  translates :title, :image_url, :gold_image_url, :flavor, :text
end
