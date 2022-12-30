class EventController < ApplicationController
  # before_action :current_user, only: %i[create new]
  def index
    @events = Event.all
  end

  def show 
    @event = Event.find(params[:id])
  end

end
