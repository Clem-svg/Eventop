class EventsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(title: params[:title], description: params[:description], start_date: params[:start_date], duration: params[:duration], price: params[:price], location: params[:location], event_admin: current_user)

    if @event.save
      flash[:notice] = "Event sauvegardé"
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def authenticate_user
    unless current_user
      flash[:danger] = "Il faut s'enregistrer bb"
      redirect_to new_user_session_path
    end
  end
end
