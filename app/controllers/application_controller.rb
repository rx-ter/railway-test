class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :http_basic_authenticate
  
  protected 
  def http_basic_authenticate
    authenticate_or_request_with_http_basic do |name, password|
      admin = Admin.find_by(name: name)
      @authenticated = admin.present? && admin.password == password
    end
  end
  

  def authenticated?
    @authenticated
  end
  helper_method :authenticated?

end
