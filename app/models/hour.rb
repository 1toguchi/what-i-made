class Hour < ActiveRecord::Base
	belongs_to :user
	validates  :hours, numericality: { less_than: 18 }
	validates  :hours, numericality: { only_integer: true }
	validates  :done, length: { maximum: 50 }
	validates  :post_date, uniqueness: true
	validates  :user_id, presence: true

end
