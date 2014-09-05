class Template < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :field

  validates_uniqueness_of :inventory, scope: :field
end