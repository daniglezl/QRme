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
  
  def invite_app
  end
  
  def invite_app_action
    NotificationMailer.invite_app_email(params['enter_email'], current_user).deliver_now
  end
  
  def accept_event
    @event = Event.find(params[:id])
    @user = current_user
  end
  
  def accept_invitation_event
    @event = Event.find(params[:id])
    Invitation.create(:event_id=>params[:id], :user_id=> current_user.id)
  end
  
  def remove_invite
    @invitation_remove = Invitation.find(params[:id])
    @invitation = @invitation_remove.event.invitations
    @invitation_remove.destroy
  end
  
  def show
    @event = EventInstance.find(params[:id]).event
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
    @event = Event.find(params[:id])
    @event.update_attributes event_params
    get_event_instances
  end

  def invite_event_errors
    @event = Event.find(params[:id])
    @user = User.find_by(email: params[:user_email])
    if @user.blank?
      @event.errors.add(:base, "A user with the specified email was not found")
    else
       NotificationMailer.accept_invite_event(current_user, @user, @event).deliver_now
    end
  end
  
  private

  def event_params
    params.require(:event).permit(:name, :recurrent, event_instances_attributes: [
      :id, :date, :location
    ])
  end


end