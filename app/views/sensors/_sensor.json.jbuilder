json.extract! sensor, :id, :name, :temp, :status, :created_at, :updated_at
json.url sensor_url(sensor, format: :json)
