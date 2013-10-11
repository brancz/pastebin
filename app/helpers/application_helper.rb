module ApplicationHelper
  def inside_layout(layout, &block)
    layout = "layouts/#{layout}" unless layout =~ %r[\Alayouts/]
    content_for :content, capture(&block)
    render template: layout
  end
end
