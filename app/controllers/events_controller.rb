class EventsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  include EventsConcern
  
  
  def invite_event
   @event = Event.find(params[:id])
  end

  def uninvite_event
   @event = Event.find(params[:id])
   @invitation = @event.invitations
  end
  
  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
    @event.event_instances.build
  end

  def create
    @event = current_user.events.build event_params
    @event.save
    get_event_instances
  end

  def edit
    @event = EventInstance.find(params[:id]).event
    @event_instance_id = params[:id]
  end

  def update
    @event = EventInstance.find(params[:id]).event
    @event.update_attributes event_params
    get_event_instances
  end

  private

  def event_params
    params.require(:event).permit(:name, :recurrent, event_instances_attributes: [
      :id, :date, :location
    ])
  end


end
