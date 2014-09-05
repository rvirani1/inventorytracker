class Field < ActiveRecord::Base
  has_many :fieldvalues
  has_many :templates
  has_many :inventories, :through => :templates
end
