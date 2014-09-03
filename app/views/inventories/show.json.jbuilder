json.inventory do
  json.id         @inventory.id
  json.name       @inventory.name
  json.created_at @inventory.created_at
  json.updated_at @inventory.updated_at
  json.items      @inventory.fieldvalues.includes(:field) do |fieldvalue|
    json.id             fieldvalue.id
    json.name           fieldvalue.field.name
    json.user_values    fieldvalue.field.user_values
    json.default_values fieldvalue.field.default_values
    json.type           fieldvalue.field.structure
    json.value          fieldvalue.value
    json.created_at     fieldvalue.created_at
    json.updated_at     fieldvalue.updated_at
  end
end
json.partial! 'shared/token'