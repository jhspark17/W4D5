class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true }

  attr_reader :password

  after_initialize :ensure_session_token
  
    def self.find_by_credentials(username, pass)
      user = User.find_by(username: username)
      if user && user.is_password?(pass)
        return user
      else
        return nil
      end
    end

  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(@password)
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end
