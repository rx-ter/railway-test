class TrainRoute < ApplicationRecord
    belongs_to :train
    
    has_many :stations
    belongs_to :departure_station, class_name: 'Station'
    belongs_to :arrival_station, class_name: 'Station'
end
