if <%= @forum_thread.errors.empty? %>
  toastr.success("Forum Thread was successfully updated", "Forum Thread updated")
  vex.closeAll()
  $(".forums-card .panel-body").html("<%= j render 'shared/forum_threads_list' %>")
else
  $(".errors-container").html("<%= j render 'shared/form_errors', object: @forum_thread %>")
