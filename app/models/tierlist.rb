class Tierlist < ActiveRecord::Base
  has_many :card_scores
  validates :user_id, presence: true

  def reset_card_scores!
    card_scores.destroy_all
    Hero.all.each do |hero|
      hero.cards_with_common.each do |card|
        card_scores.create(hero: hero, card: card, score: 0)
      end
    end
  end

  def reset_to!(tierlist)
    card_scores.destroy_all
  end
end
