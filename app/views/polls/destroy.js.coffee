toastr.success("The poll was successfully destroyed", "Poll destroyed")
$(".polls-card .panel-body").html("<%= j render 'shared/polls_list' %>")
