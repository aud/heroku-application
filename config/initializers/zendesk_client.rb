class ZendeskClient < ZendeskAPI::Client
  def self.instance
    @instance ||= new do |config|
      config.url = Rails.application.secrets.zendesk_url
      config.username = Rails.application.secrets.zendesk_username
      config.token = Rails.application.secrets.zendesk_token

      config.retry = true
      config.logger = Rails.logger
    end
  end
end
