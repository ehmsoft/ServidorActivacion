class Usuario < ActiveRecord::Base
  attr_accessible :correo, :nombre, :password, :password_confirmation

  has_secure_password
  before_save { |user| user.correo = correo.downcase }
  before_save :create_remember_token
  
  VALID_PASSWORD_REGEX = /[a-zA-Z][a-zA-Z0-9]{7,}/
  validates :password, presence: true, length: { minimum: 8 }, format: { with: VALID_PASSWORD_REGEX}
  validates :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :correo, presence:  true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
