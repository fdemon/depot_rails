require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
   test "Product price must be positive" do
     product = Product.new(:title => "MY book title", :descript => "yyy", :image_url => "zzz.jpg")
     product.price =-1
     assert product.invalid?
     assert_equal "must be greater than or equal to 0.01",product.errors[:price].join('; ')
     
     product.price = 0
     assert product.invalid?
     assert_equal "must be greater than or equal to 0.01", product.errors[:price].join('; ')
     
     product.price = 1
     assert product.invalid?
   end
   
   test "product id not valid without a unique title" do
     product = Product.new(:title => products(:ruby).title, :descript => "yyy", :price => 1, :image_url => "fred.gif")
     assert !product.save
     assert_equal "has already been taken",product.errors[:title].join('; ')
   end
end
