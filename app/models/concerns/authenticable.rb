module Authenticable
  extend ActiveSupport::Concern

  included do
    attr_accessor :password
    before_save :encrypt_password
    before_create :generate_token

    validates_confirmation_of :password
    validates_presence_of :password, :on => :create

    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end

    def generate_token
      self.token = SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
      self.generate_token if self.class.find_by(token: self.token)
    end
  end

  module ClassMethods
    def authenticate(email, password)
      user = find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user.token
      else
        nil
      end
    end
  end
end