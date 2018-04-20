json.extract! result, :id, :sensor_id, :high, :low, :value, :created_at, :updated_at
json.url result_url(result, format: :json)
