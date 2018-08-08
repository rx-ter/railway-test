class Station < ApplicationRecord
    belongs_to :train_route
    has_many :arriving_stations, foreign_key: :arrival_station_id, class_name: 'TrainRoute'
    has_many :departing_stations, foreign_key: :departure_station_id, class_name: 'TrainRoute'
end
