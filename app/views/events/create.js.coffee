if <%= @event.errors.empty? %>
  vex.closeAll()
  toastr.success("An event was successfully created", "Event created")
  $(".main-table-container")
  .before("<%= j render 'events_list', event_instances: @event_instances %>")
  .remove()
else
  $(".errors-container").html("<%= j render 'shared/form_errors', object: @event %>")
