module EventsConcern
  extend ActiveSupport::Concern

  def get_event_instances
    if current_user.is? :admin
      @event_instances = EventInstance.all.order(:date)
    else
      @event_instances = current_user.event_instances.order(:date)
    end
  end

end
