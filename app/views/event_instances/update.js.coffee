vex.closeAll()
toastr.success("The selected event instnce was successfully updated", "Event Instance updated")
$(".main-table-container")
  .before("<%= j render 'events_list', event_instances: @event_instances %>")
  .remove()