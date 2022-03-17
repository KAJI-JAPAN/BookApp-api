json.array! @schedules do |schedule|
  json.id schedule.id
  json.name schedule.name
  json.color schedule.color
  # UNIX時間msをYY-MM-DD HH:MMに変換
  # json.start l(Time.at(schedule.start.to_i / 1000))
  # json.end l(Time.at(schedule.end.to_i / 1000))
  json.start schedule.start.to_i
  json.end schedule.end.to_i
  # UNIX時間に変換
  # json.start Time.parse(schedule.start).to_i * 1000
  # json.end Time.parse(schedule.end).to_i * 1000
  json.created_at l schedule.created_at
  json.updated_at l schedule.updated_at
  json.timed true
end