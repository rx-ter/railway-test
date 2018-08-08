json.extract! train, :id, :departure_station, :arrival_station, :train, :created_at, :updated_at
json.url train_url(train, format: :json)
