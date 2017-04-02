if <%= @attachment.errors.empty? %>
  vex.closeAll()
  toastr.success("An attachment was successfully uploaded", "Attachment uploaded")
  $(".attachment-card .panel-body").html("<%= j render 'shared/attachments_list' %>")
else
  $(".errors-container").html("<%= j render 'shared/form_errors', object: @attachment %>")
