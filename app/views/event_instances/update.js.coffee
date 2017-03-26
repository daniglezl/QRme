if <%= @event_instance.errors.empty? %>
  vex.closeAll()
  toastr.success("The selected event instnce was successfully updated", "Event Instance updated")
  $(".events_instances-card .panel-body").html("<%= j render 'shared/events_instances_list' %>")
else
     $(".errors-container").html("<%= j render 'shared/form_errors', object: @event_instance %>")
