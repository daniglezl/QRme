toastr.success("The poll answer was successfully destroyed", "Poll answer destroyed")
$(".poll_answers-card .panel-body").html("<%= j render 'shared/poll_answers_list' %>")
vex.closeAll()
qrModal.open("<%= j render 'polls/edit_form' %>")