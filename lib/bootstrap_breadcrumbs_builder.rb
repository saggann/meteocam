# The BootstrapBreadcrumbsBuilder is a Bootstrap compatible breadcrumb builder.
# It provides basic functionalities to render a breadcrumb navigation according to Bootstrap's conventions.
#
# BootstrapBreadcrumbsBuilder accepts a limited set of options:
# * separator: what should be displayed as a separator between elements
#
# You can use it with the :builder option on render_breadcrumbs:
#     <%= render_breadcrumbs :builder => ::BootstrapBreadcrumbsBuilder, :separator => "&raquo;" %>
#
# Note: You may need to adjust the autoload_paths in your config/application.rb file for rails to load this class:
#     config.autoload_paths += Dir["#{config.root}/lib/"]
#
class BootstrapBreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
  def render
    @context.content_tag(:ul, :class => 'breadcrumb') do
      elements_count = @elements.size
      i = 0
      @elements.collect do |element|
        i += 1
        render_element(element, last = (i == elements_count))
      end.join.html_safe
    end
  end

  def render_element(element, last = false)
    current = @context.current_page?(compute_path(element))

    @context.content_tag(:li, :class => ('active' if last)) do
      if last
        link_or_text = compute_name(element)
      else
        link_or_text = @context.link_to(compute_name(element), compute_path(element), element.options)
      end

      divider = @context.content_tag(:span, (@options[:separator] || ' / ').html_safe, :class => 'divider') unless last

      link_or_text + (last ? '' : (divider || ''))
    end
  end
end
  
  