class Inventory < ActiveRecord::Base
  has_many :fieldvalues
  belongs_to :user
end
