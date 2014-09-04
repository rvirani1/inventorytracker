class Item < ActiveRecord::Base
  belongs_to :inventory
  has_many :fieldvalues

end
