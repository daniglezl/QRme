$(".comments-list").html("""
  <%= j render_comments @forum_thread.comments.arrange(order: :created_at) %>
""")
$(".comment-<%= @comment.id %>").before("""
  <div class="well well-sm new-comment">
    <%= j render 'new_edit_form' %>
  </div>
""").remove()
