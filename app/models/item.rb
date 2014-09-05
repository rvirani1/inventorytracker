class Item < ActiveRecord::Base
  belongs_to :inventory
  has_many :fieldvalues
  after_create :attach_fields

  def setFieldValue params
    fieldvalue = self.fieldvalues.find params[:fieldvalue_id]
    fieldvalue.value = params[:value]
    fieldvalue.save!
  end


  def attach_fields
    template_fields = self.inventory.template_fields
    template_fields.each do |template_field|
      self.fieldvalues.create! field: template_field
    end
  end


end
