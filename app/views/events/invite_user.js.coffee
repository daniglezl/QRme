if <%= @event.errors.empty? %>
  toastr.success("User was successfully invited to event", "User invited")
  vex.closeAll()
else
  $(".errors-container").html("<%= j render 'shared/form_errors', object: @event %>")
