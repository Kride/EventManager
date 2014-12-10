class FrontController < ApplicationController

  respond_to :html

  def index
    @upcoming_events = Event.where("start_time > ?", DateTime.now).order(:start_time).limit(10)
    @locations = Location.all
  end
end
