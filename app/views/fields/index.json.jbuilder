json.inventory @inventory.id
json.fields @fields do |field|
  json.(field, :id, :name, :user_values, :default_values, :structure)
end
