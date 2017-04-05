if <%= @poll_answer.errors.empty? %>
  toastr.success("Poll answer was successfully created", "Poll answer created")
  vex.closeAll()
  $(".poll_answers-card .panel-body").html("<%= j render 'shared/poll_answers_list' %>")
  qrModal.open("<%= j render 'polls/edit_form' %>")
else
  $(".errors-container").html("<%= j render 'shared/form_errors', object: @poll_answer %>")
