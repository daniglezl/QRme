toastr.success("The selected event was successfully destroyed", "Event destroyed")
$(".events_instances-card .panel-body").html("<%= j render 'shared/events_instances_list' %>")
