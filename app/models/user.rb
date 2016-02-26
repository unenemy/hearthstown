class User < ActiveRecord::Base
  include Authenticable

  validates :email, :nickname, presence: true
end
