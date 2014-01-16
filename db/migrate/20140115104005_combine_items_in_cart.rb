class CombineItemsInCart < ActiveRecord::Migration
  def change
  end

  def self.up 
  	# replace multiple items for a single product in a cart with a single item
  	Cart.all.each do |cart|
  		# count the number of each product in the cart
  		sums = cart.cart_items.group(:product_id).sum(:quantity)

  		sums.each do |product_id, quantity|
  			if quantity > 1
  				# remove individual items
  				cart.cart_items.where(:product_id=>product_id).delete_all

  				# replace with a single item
  				cart.cart_items.create(:product_id=>product_id, :quantity=>quantity)
  			end
  		end
  	end
  end

  def self.down
    # splits items with quantity > 1 into multiple items
    CartItem.where("quantity>1").each do |cartitem|
      #add individual items
      cartitem.quantity.times do 
        CartItem.create :cart_id=>cartitem.cart_id, :product_id=>cartitem.product_id, :quantity=>1
      end

      #remove original item
      cartitem.destroy
    end
  end

end
