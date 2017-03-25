module CommentsHelper

  def render_comments comments
    comments.map do |comment, sub_comments|
      render(comment) + content_tag(:div, render_comments(sub_comments), class: "nested-comments")
    end.join.html_safe
  end

end
