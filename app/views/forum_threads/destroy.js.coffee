toastr.success("The selected forum was successfully destroyed", "Forum destroyed")
$(".forums-card .panel-body").html("<%= j render 'shared/forum_threads_list' %>")
