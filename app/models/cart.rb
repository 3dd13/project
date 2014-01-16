class Cart < ActiveRecord::Base
	
	has_many :cart_items, :dependent => :destroy

	def add_product(product_id)
		current_item = cart_items.where(:product_id => product_id).first
		if current_item
			current_item.quantity += 1
		else
			current_item = cart_items.build(:product_id => product_id)
		end
		current_item
	end

end
