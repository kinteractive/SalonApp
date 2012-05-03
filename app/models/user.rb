class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  has_secure_password
  
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  
  has_many :authentications, :dependent => :destroy
  
  before_save :create_remember_token
  
  def is_admin?
    email == 'prashant@pinksthebeautyboutique.com' || 'shelby@pinksthebeautyboutique.com' || 'vanessa@pinksthebeautyboutique.com'
  end

  private
  
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    
end
