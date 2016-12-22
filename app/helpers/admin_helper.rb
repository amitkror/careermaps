module AdminHelper

  def per_page(n)
    (link_to "#{n}",
      "?per_page=#{n}",
      class: 'button button-primary ' + (@per_page.to_s == n.to_s ? "on" : ""),
        title: n).html_safe
  end

  def sortable_header(order, text="", default=false)
    text = order.titleize if text.blank?
    dir = params[:dir] == "desc" ? "asc" : "desc"
    klass = (params[:order] == order || (params[:order].blank? && default)) ? "on" : ""
    args = params.merge({ order: order, dir: dir })
    args.delete(:controller)
    args.delete(:action)
    args.delete(:type)
    link_to(spaceless(text), "?" + args.to_query, class: "#{klass} #{dir}").html_safe
  end

  def spaceless(text)
    text.gsub(' ', '&nbsp;').html_safe
  end

end
