class EventInstancesController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  include EventsConcern

  def new
    event = Event.find(params[:id])
    @event_instance = event.event_instances.build
  end

  def create
    event = Event.find(params[:event_id])
    @event_instance = event.event_instances.build event_instance_params
    @event_instance.save
    @event = Event.find(params[:event_id])
  end
  
  
  def edit
    @event_instance = EventInstance.find(params[:id])
  end
 

  def update
    @event_instance = EventInstance.find(params[:id])
    @event_instance.update_attributes event_instance_params
    @event = @event_instance.event
  end
  
  def destroy
    @event_instance = EventInstance.find(params[:id])
    @event = @event_instance.event
    @event_instance.destroy
    @event.destroy if @event.event_instances.count < 1
    get_event_instances
  end
  
  def qrcode
    @event_instance = EventInstance.find(params[:id])
  end
  
  def event_instance_params
    params.require(:event_instance).permit(:date, :location)
  end
end
