class CreationInitial < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :user_name
      t.integer :train_id
      t.string :description
      t.float :cost

      t.timestamps
    end
    
    create_table :trains do |t|
      t.integer :train_route_id
      t.integer :passengers_capacity
      t.float :price
      t.timestamps
    end

    create_table :train_routes do |t|
      t.integer :departure_station_id
      t.integer :arrival_station_id
      t.belongs_to :train, index: true
      t.timestamps
    end

    create_table :stations do |t|
      t.string :name
      t.string :city
      t.string :address
      t.belongs_to :train_route, index: true
      t.timestamps
    end

  end
end
