require 'spec_helper'

describe Product do
  
  describe "#validates" do

  	context "when there is name, price and image url" do
  		it "should be valid" do
  			
  			data = {
  				name: "Pak 1",
  				price: 25,
  				image_url: "string.jpg"
  			}

  			product = Product.new(data)
  			product.should be_valid

  		end
 		end
  end


 end
