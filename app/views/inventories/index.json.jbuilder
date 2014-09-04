json.inventories @inventories do |inventory|
  json.id         inventory.id
  json.name       inventory.name
  json.created_at inventory.created_at
  json.updated_at inventory.updated_at
  json.items      inventory.items.count
end

json.partial! 'shared/token'