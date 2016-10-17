class HomeController < ApplicationController
  def index
  end

  def humans
    render 'humans', layout: false, formats: [:text]
  end
end
