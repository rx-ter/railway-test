class HomeController < ApplicationController

  skip_before_action :http_basic_authenticate
  
  autocomplete :station, :name

  # GET /homes
  # GET /homes.json
  def index    
  end

end
