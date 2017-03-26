class EventInstancesController < ApplicationController
  before_action :authenticate_user!
  include EventsConcern

  def destroy
    @event_instance = EventInstance.find(params[:id])
    event = @event_instance.event
    @event_instance.destroy
    event.destroy if event.event_instances.count < 1
    get_event_instances
  end

  def edit
    @event_instance = EventInstance.find(params[:id])
  end
 

  def update
    @event_instance = EventInstance.find(params[:id])
    @event_instance.update_attributes event_instance_params
    
  end
  
   def event_instance_params
    params.require(:event_instance).permit(:date, :location)
  end
end
