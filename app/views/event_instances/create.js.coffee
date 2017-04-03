if <%= @event_instance.errors.empty? %>
  vex.closeAll()
  toastr.success("An event instance was successfully created", "Event Instance created")
  $(".events_instances-card .panel-body").html("<%= j render 'shared/events_instances_list' %>")
else
  $(".errors-container").html("<%= j render 'shared/form_errors', object: @event_instance %>")
