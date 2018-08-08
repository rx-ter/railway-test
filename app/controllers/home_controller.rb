class HomeController < ApplicationController

  autocomplete :station, :name

  # GET /homes
  # GET /homes.json
  def index    
  end

end
