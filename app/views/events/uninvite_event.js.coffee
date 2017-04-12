qrModal.open("<%= j render 'uninvite_form' %>")
$("#Button_done").click(->vex.closeAll())
$("#Button_done").click(->location.reload())
