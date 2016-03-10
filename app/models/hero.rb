class Hero < ActiveRecord::Base
  has_many :cards, -> { includes(:translations) }
  validates :code, uniqueness: true

  def cards_with_common
    Card.includes(:translations).where('hero_id IS NULL or hero_id = ?', self.id)
  end
end
