toastr.success("The selected comment was successfully destroyed", "Comment destroyed")
$(".comments-list").html("""
  <%= j render_comments @forum_thread.comments.arrange(order: :created_at) %>
""")
