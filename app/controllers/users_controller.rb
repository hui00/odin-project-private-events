class UsersController < ApplicationController
  # include Events


  before_action :authenticate_user!, only: [:create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @event = Event.new
  end

def create
  @event = current_user.events.build(event_params)
  if @event.save
    redirect_to @event, notice: "Event was successfully created."
  else
    render :new
  end
end

  private

  def event_params
    params.require(:event).permit(:name, :date)
  end
end
