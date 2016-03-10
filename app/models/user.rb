class User < ActiveRecord::Base
  include Authenticable

  has_many :tierlists
  validates :email, :nickname, presence: true
end
