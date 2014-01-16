class CartItem < ActiveRecord::Base

	belongs_to :product
	belongs_to :cart 

	validates :quantity, presence: true, :numericality => {:greater_than => 0 }, :allow_nil => false
end
