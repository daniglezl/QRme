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
    @invitation = Invitation.find_by(event_id: @event.id, user_id: current_user.id)
    if @invitation == nil
       Invitation.create(:event_id=> @event.id, :user_id=> current_user.id)
    end
  end
  
  def remove_invite
    @invitation_remove = Invitation.find(params[:id])
    @invitation = @invitation_remove.event.invitations
    @invitation_remove.destroy
  end
  
  def leave_event
    @event = Event.find(params[:id])
    @invitation_remove = Invitation.find_by(user_id: current_user.id, event_id: @event.id )
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
    e = Event.find(@event.id)
    ei = e.event_instances.first
    location = ei.location
    date = ei.date
    r = e.recurrent
    for i in 0..r-1
      date = date + 7.days
      e.event_instances.create(:location=> location,:date=> date)
    end 
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
  
  def qrcode
    @event = Event.find(params[:id])
    qr = RQRCode::QRCode.new("i"+ @event.id.to_s, :size => 4, :level => :h ).to_img
    @qrimg = qr.resize(200, 200)
  end
  
  def destroy
    event = Event.find(params[:id])
    event.destroy
  end


  private

  def event_params
    params.require(:event).permit(:name, :recurrent,:open, event_instances_attributes: [
      :id, :date, :location
    ])
  end


end