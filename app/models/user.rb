class User < ActiveRecord::Base
  has_secure_password

  has_many :hours, dependent: :destroy
  

  validates :name, presence: true, length: { maximum: 12, allow_blank: true }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
       uniqueness: true
  validates :name, format: { with: /[A-Za-z]/ }
  validates :name, length: { maximum: 20, allow_blank: true }
  validates :name, uniqueness: { case_sensitive: false }
  validates :password, presence: { on: :create }
  validates :password, :confirmation => true
  validates :password, format: { with: /[A-Za-z]/ }

  def sum_by_a_week
    self.hours.a_week.sum(:hours)
  end

  def sum_by_a_month
    self.hours.a_month.sum(:hours)
  end

  def grade_str
    %w(高校一年　高校二年　高校三年　浪人生).at(self.grade)
  end
end
