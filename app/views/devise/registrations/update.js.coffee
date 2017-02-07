if <%= resource.errors.empty? %>
  toastr.success("Profile was successfully updated", "Profile updated")
  vex.closeAll()
  $(".profile-image").before("<%= j render 'shared/avatar' %>").remove()
else
  $(".errors-container").html("<%= j render 'shared/form_errors', object: resource %>")
