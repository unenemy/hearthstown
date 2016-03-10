class CardScore < ActiveRecord::Base
  belongs_to :card
  belongs_to :hero
  belongs_to :tierlist
  validates :hero_code, presence: true
  validates :card_id, uniqueness: { scope: [:tierlist_id, :hero_id] }

  def hero=(value)
    self.hero_code = value.code
    super(value)
  end
end
