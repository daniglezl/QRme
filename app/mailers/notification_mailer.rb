class NotificationMailer < ApplicationMailer
  default from: "donotreply@qrmeapp.com"

  def forum_thread_created forum
    @forum = forum
    @event = @forum.event
    emails = @event.invited_users.pluck(:email).join(", ")
    emails = "daniglezl@yahoo.com"
    if !emails.blank?
      mail to: emails,
        from: "QRme App",
        subject: "Forum '#{ @forum.title }' has been added to event '#{ @event.name }'"
    end
  end
  
  def accept_invite_event (current_user, user_param, event_param)
    @user = user_param
    @email = @user.email
    @event = event_param
    @current_user = current_user
    mail to: @email,
    from: "QRme App",
      subject: "#{ @current_user.username }, has sent you an invitation to event '#{ @event.name }'"
  end

end
