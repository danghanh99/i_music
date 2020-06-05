class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include SessionsHelper
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response

  protected

  def render_record_not_found_response error
    render html: error
  end
end
