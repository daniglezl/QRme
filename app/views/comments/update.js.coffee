$(".comments-list").html("""
  <%= j render_comments @forum_thread.comments.arrange(order: :created_at) %>
""")
