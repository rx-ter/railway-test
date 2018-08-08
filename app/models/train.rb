class Train < ApplicationRecord
    has_one :train_route
    
    def has_places
        true if passengers_capacity > 0
        false
    end
end
