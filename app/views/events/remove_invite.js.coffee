toastr.success("The user was removed from the invitation list successfully")
$(".main-table-container").html("<%= j render 'shared/uninvite_users_list',  object: @invitation %>")