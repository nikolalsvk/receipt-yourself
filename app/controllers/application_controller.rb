class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  respond_to :json
  before_action :verify_request_format!
end
