class Api::BaseController < ActionController::Base
  before_action :authorize_user

  def authorize_user
  end
end
