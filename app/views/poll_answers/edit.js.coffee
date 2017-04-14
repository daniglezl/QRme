toastr.success("The poll answer was successfully recored", "Poll answer recorded")
vex.closeAll()
$(".panel-body").html("<%= j render 'shared/poll_answers_table' %>")