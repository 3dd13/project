class Product < ActiveRecord::Base

	validates :name, presence: true
	validates :price, presence: true, :numericality => {:greater_than => 0 }, :allow_nil => false
	validates :image_url, presence: true

	has_many :cart_items

	before_destroy :ensure_not_referenced_by_any_cart_item

	# ensure that there are no cart items referencing this product
	def ensure_not_referenced_by_any_cart_item
		if cart_items.count.zero?
			return true
		else
			errors.add(:base, 'This product still exists as a Cart Item in a Cart')
			return false
		end
	end
end
