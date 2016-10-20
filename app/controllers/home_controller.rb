require 'reloader/sse'

class HomeController < ApplicationController
	include ActionController::Live
  def index
  end

  def humans
    render 'humans', layout: false, formats: [:text]
  end

  def log_feed
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream)
    sse.write('test')
  ensure
    sse.close
  end
end
