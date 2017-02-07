window.qrModal = {
  open: (content) ->
    vex.dialog.open()
    $(".vex .vex-content").html(content)
}

# toastr configuration
toastr.options = {
  "closeButton": true,
  "progressBar": true,
  "positionClass": "toast-bottom-right",
  "preventDuplicates": true
}

# override default confirm dialog
$.rails.allowAction = (link) ->
  return true unless link.attr('data-confirm')
  $.rails.showConfirmDialog(link)
  false
$.rails.confirmed = (link) ->
  link.removeAttr('data-confirm')
  link.trigger('click.rails')
$.rails.showConfirmDialog = (link) ->
    title = link.attr('data-confirm')
    message = link.attr('data-message')
    swal {
      title: title || ""
      text: message || ""
      type: 'warning'
      showCancelButton: true
      confirmButtonColor: '#FF5D4F'
      confirmButtonText: 'Yes'
      cancelButtonText: 'No'
      closeOnConfirm: false
    }, (isConfirm) ->
      if isConfirm
        $.rails.confirmed link
      return

$(document).on('turbolinks:load', ->
  vex.defaultOptions.className = 'vex-theme-plain'

  $("body").on("mouseenter", "i.fa.spin", ->
    $(this).addClass("fa-spin")
  )
  $("body").on("mouseleave", "i.fa.spin", ->
    $(this).removeClass("fa-spin")
  )
)
