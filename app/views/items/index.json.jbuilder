json.items @items do |item|
  json.(item, :id, :created_at, :updated_at)
  json.fields item.fieldvalues.includes(:field) do |fieldvalue|
    # item = item.fieldvalues.includes(:field)

    json.(fieldvalue.field, :name, :user_values, :default_values, :structure )
    json.value fieldvalue.value
  end
end

json.partial! 'shared/token'