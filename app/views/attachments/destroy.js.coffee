toastr.success("The selected attachment was successfully deleted", "Attachment deleted")
$(".attachments-card .panel-body").html("<%= j render 'shared/attachments_list' %>")
