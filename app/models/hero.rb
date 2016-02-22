class Hero < ActiveRecord::Base
  has_many :cards
  validates :code, uniqueness: true
end
