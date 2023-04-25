module ApplicationHelper
  def bootstrap_class_for_flash(flash_type)
    case flash_type.to_sym
    when :success
        "alert-success"
    when :error
        "alert-danger"
    when :alert
        "alert-warning"
    when :notice
        "alert-info"
    else
        flash_type.to_s
    end
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, :fenced_code_blocks => true, :tables => true)
    markdown.render(text).html_safe
  end
end
