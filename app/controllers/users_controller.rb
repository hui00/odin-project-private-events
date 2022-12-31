class UsersController < ApplicationController
  # include Events

  before_action :authenticate_user!, only: [:create]

  before_action :set_user, only: [:show, :create]
  # before_action :authenticate_user!, only: [:create]

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
      puts @event.errors.full_messages
      render :show,
             status: :unprocessable_entity,
             notice: "Event was not created."
    end
  end


  private


   def set_user
    @user = current_user
  end

  def event_params
    params.require(:event).permit(:name, :date, :creator_id)
  end
end
