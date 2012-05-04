class Service < ActiveRecord::Base
  attr_accessible :description, :name, :position, :price
end
