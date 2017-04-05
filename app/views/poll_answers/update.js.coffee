if <%= @poll.errors.empty? %>
  toastr.success("Poll was successfully updated", "Poll updated")
  vex.closeAll()
  $(".polls-card .panel-body").html("<%= j render 'shared/polls_list' %>")
else
  $(".errors-container").html("<%= j render 'shared/form_errors', object: @poll %>")
