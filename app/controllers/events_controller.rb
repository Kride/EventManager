class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @events = Event.all
    @locations = Location.all
    if user_signed_in?
      @registered_events = current_user.events
    end
    respond_with(@events)
  end

  def show
    @location = Location.find_by_id(@event.location).name
    @registered_users = @event.users
    respond_with(@event)
  end

  def new
    @event = Event.new
    @new_location = Location.new
    @locations = Location.order(:name)
    respond_with(@event)
  end

  def edit
    @new_location = Location.new
    @locations = Location.order(:name)
  end

  def create
    success = true
    @event = Event.new(event_params.except(:location))
    
    unless event_params[:location_id] == "0"
      @event.location = Location.find(event_params[:location_id])
    else
      @new_location = Location.new(event_params[:location])
      if @new_location.save
        @event.location = @new_location
        @event.location_id = @new_location.id
      else
        success = false
        #@new_location.errors.each do |error|
        # TODO add error messages to @event
        #end
      end
    end
    
    unless @event.save
      success = false
    end

    if success
      respond_with(@event)
    else
      @new_location = Location.new
      @locations = Location.order(:name)
      render action: "new"
    end      
  end

  def update
    success = true

    unless event_params[:location_id] == "0"
      @event.location = Location.find(event_params[:location_id])
    else
      @new_location = Location.new(event_params[:location])
      if @new_location.save
        @event.location = @new_location
        @event.location_id = @new_location.id
      else
        success = false
        #@new_location.errors.each do |error|
        # TODO add error messages to @event
        #end
      end
    end

    unless @event.update(event_params.except(:location))
      success = false
    end
    
    if success
      respond_with(@event)
    else
      @new_location = Location.new
      @locations = Location.order(:name)
      render action: "edit"
    end

  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :start_time, :end_time, :location_id,
        location: [:id, :name, :address, :phone, :url])
    end
end
