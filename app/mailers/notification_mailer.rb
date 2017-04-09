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

end
