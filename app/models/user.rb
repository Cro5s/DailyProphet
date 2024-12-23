class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 20 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, :session_token, :password_digest, presence: true
  validates :username, :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6 }

  has_many :stories,
           primary_key: :id,
           foreign_key: :author_id,
           class_name: 'Story',
           inverse_of: :author,
           dependent: :destroy

  has_many :responses,
           primary_key: :id,
           foreign_key: :author_id,
           class_name: 'Response',
           inverse_of: :author,
           dependent: :destroy

  attr_reader :password

  after_initialize :ensure_session_token

  def self.find_credentials_by(username, password)
    user = User.find_by(username: username)
    return user if user&.valid_password?(password)

    nil
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    save!

    session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  private

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
