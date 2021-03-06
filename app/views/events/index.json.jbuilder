json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :start_time, :end_time, :location_id
  json.url event_url(event, format: :json)
end
