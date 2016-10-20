require 'reloader/sse'

class HomeController < ApplicationController
	include ActionController::Live
  def index
  end

  def humans
    render 'humans', layout: false, formats: [:text]
  end

  def log_feed
    logs = `tail -n 25 log/#{Rails.env}.log`.split(/\n/)
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream)
    sse.write(logs)
  ensure
    sse.close
  end
end
