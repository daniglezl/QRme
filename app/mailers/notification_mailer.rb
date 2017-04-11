class NotificationMailer < ApplicationMailer
  default from: "donotreply@qrmeapp.com"

  def forum_thread_created forum
    @forum = forum
    @event = @forum.event
    emails = @event.invited_users.pluck(:email).join(", ")
    if !emails.blank?
      mail to: emails,
        from: "QRme App",
        subject: "Forum '#{ @forum.title }' has been added to event '#{ @event.name }'"
    end
  end
  
  def invite_app_email (email, currentuser)
    @name = currentuser
    mail to: email,
    from: "QRme App",
    subject: "Invitation to join Qrme app"
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

  def forum_thread_updated forum
    @forum = forum
    @event = @forum.event
    emails = @event.invited_users.pluck(:email).join(", ")
    if !emails.blank?
      mail to: emails,
        from: "QRme App",
        subject: "Forum '#{ @forum.title }' in event '#{ @event.name }' has been edited"
    end
  end

  def forum_thread_destroyed event, forum_title
    @event = event
    @forum_title = forum_title
    emails = @event.invited_users.pluck(:email).join(", ")
    if !emails.blank?
      mail to: emails,
        from: "QRme App",
        subject: "Forum '#{ @forum_title }' in event '#{ @event.name }' has been removed"
    end
  end

  def comment_created comment
    @forum = comment.forum_thread
    @user = comment.user
    @event = @forum.event
    emails = @event.invited_users.pluck(:email).join(", ")
    if !emails.blank?
      mail to: emails,
        from: "QRme App",
        subject: "#{ @user.username } commented on forum '#{ @forum.title }' in event '#{ @event.name }'"
    end
  end

end
