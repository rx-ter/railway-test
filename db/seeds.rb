# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


20.times {
    Station.create(name: Faker::Company.name, city: Faker::Address.city, address: Faker::Address.street_address)
}

20.times {
    stations = Station.order("RANDOM()").limit(2)
    train = Train.create(passengers_capacity: 230, price: Faker::Number.between(15, 40))
    train_route = TrainRoute.create(train: train, departure_station_id: stations.first.id, arrival_station_id: stations.second.id)
    train.update(train_route_id: train_route.id)
}