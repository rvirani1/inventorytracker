class Inventory < ActiveRecord::Base
  has_many :items
  belongs_to :user
  has_many :templates
  has_many :template_fields, :source => :field, :through => :templates

  def update params
    self.name = params[:name] if params[:name]
    if params[:field_id]
      params[:field_id].each do |field_id|
        self.template_fields.push Field.find(field_id)
      end
    end
  end
end
