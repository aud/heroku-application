class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  
  def client
    ZendeskClient.instance
  end
end
