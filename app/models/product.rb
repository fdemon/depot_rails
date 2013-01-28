class Product < ActiveRecord::Base
  attr_accessible :descript, :image_url, :price, :title
end
