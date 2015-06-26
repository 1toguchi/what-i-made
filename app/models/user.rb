class User < ActiveRecord::Base
  has_secure_password

  has_many :entries, dependent: :destroy
  

  validates :name, presence: true, length: { maximum: 12, allow_blank: true }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
       uniqueness: true
  #validates :name, format: { with: /[A-Za-z]/ }
  #validates :name, length: { maximum: 20, allow_blank: true }
  #validates :name, uniqueness: { case_sensitive: false }
  validates :password, presence: { on: :create }
  validates :password, :confirmation => true
  validates :password, format: { with: /[A-Za-z]/ }



end
