class Service < ActiveRecord::Base
  attr_accessible :description, :name, :position, :price, :category_id
  
  belongs_to :category
end
