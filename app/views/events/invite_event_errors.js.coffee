$("#user_email").val("")
if <%= @event.errors.empty? %>
  toastr.success("User was successfully invited to event", "User invited")
else
  $(".errors-container").html("<%= j render 'shared/form_errors', object: @event %>")
