json.array! @schedules do |schedule|
  json.id schedule.id
  json.name schedule.name
  json.color schedule.color
  json.start schedule.start
  json.end schedule.end
  json.created_at l schedule.created_at
  json.updated_at l schedule.updated_at
end