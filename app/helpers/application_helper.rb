module ApplicationHelper

  def body_class(cls)
    content_for(:body_class) { cls }
  end

  # Meta tag helpers
  def default_meta_description
    ""
  end

  def default_title
    "NYC Career Line - Mapping Your Future!"
  end

  def meta_description(description)
    return "" if description.blank?
    description = strip_tags(description).split[0...80].join(' ')
    content_for(:meta_description) { "#{description.to_s}" }
  end

  def share_image(image)
    content_for(:share_image) { image } unless image.blank?
  end

  def title(page_title)
    content_for(:title) { "#{page_title.to_s} : #{default_title}" }
  end

  # Text helpers
  def external_link(url, text="")

    return "" if url.blank?

    if text == ""
      text = url.gsub('http://', '').gsub('https://', '').gsub('www.', '')
    end

    url = "http://#{url}" if url.index("http").blank?

    return "<a href='#{url}' class='external' title='#{url}'>#{text}</a>".html_safe
  end

  def broken_text(text)
    h(text).gsub("\n", "<br>").html_safe
  end

  # Navigation helpers
  def nav
    Page.nav
  end

  # UI Helpers
  def on_class(path)
    return 'on' if request.fullpath.starts_with? path
    ''
  end

  def on_class_admin_home
    return 'on' if request.fullpath == admin_root_path
    ''
  end

  def on_class_home
    return 'on' if request.fullpath == root_path
    ''
  end
end
