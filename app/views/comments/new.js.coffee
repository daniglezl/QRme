$(".new-comment").remove()
$(".comment-<%= @comment.parent_id %>").after("""
  <div class="well well-sm new-comment">
    <%= j render 'new_edit_form' %>
  </div>
  """
)
$("#comment_body").focus()
