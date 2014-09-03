class Fieldvalue < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :field
end
