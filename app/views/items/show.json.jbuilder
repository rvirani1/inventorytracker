json.(@item, :id, :created_at, :updated_at)
json.fields @item.fieldvalues.includes(:field) do |fieldvalue|
  json.(fieldvalue.field, :name, :user_values, :default_values, :structure)
  json.value fieldvalue.value
end

json.partial! 'shared/token'