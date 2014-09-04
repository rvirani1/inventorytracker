json.inventory do
  json.(@inventory, :id, :name, :created_at, :updated_at)
  json.items      @inventory.items do |item|
    json.(item, :id, :created_at, :updated_at)
    json.fields   item.fieldvalues.includes(:field) do |fieldvalue|
      json.(fieldvalue.field, :name, :user_values, :default_values, :structure )
      json.value          fieldvalue.value
    end
  end
end
json.partial! 'shared/token'