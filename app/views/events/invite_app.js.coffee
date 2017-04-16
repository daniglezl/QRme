qrModal.open("<%= j render 'invite_app_form' %>")
$("#guest_email").focus()
$("#Button_done").click(->vex.closeAll())