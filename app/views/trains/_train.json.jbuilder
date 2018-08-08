json.extract! train, :id, :departure_station_id, :arrival_station_id, :departure_time, :arrival_time, :passengers_capacity, :price, :created_at, :updated_at
json.url train_url(train, format: :json)
