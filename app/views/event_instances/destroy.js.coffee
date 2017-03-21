toastr.success("The selected event was successfully destroyed", "Event destroyed")
$(".main-table-container")
  .before("<%= j render 'events/events_list', event_instances: @event_instances %>")
  .remove()
