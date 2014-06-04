require 'nanoc/helpers/rendering'
require 'nanoc/helpers/breadcrumbs'
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::Breadcrumbs

module NavigationHelpers
  def is_active_if_home
    if @item.identifier == '/'
      'is-active'
    end
  end

  def is_active_if_section(section)
    if @item.identifier.start_with?(section)
      'is-active'
    end
  end

  def section_breadcrumb_titles
    breadcrumbs_trail.slice(1..breadcrumbs_trail.length - 2).map { |i| i[:title] }
  end

  def section_navigation(path)
    section = @items[path]
    render 'helpers/navigation_helpers/section_navigation', section: section
  end

  def sorted_children(item)
    children = item.children
    sorted_items_with_navigation(children) + sorted_items_without_navigation(children)
  end

  def api_documentation_section?(section)
    section[:title] =~ /\Av\d+/
  end

  def sorted_children_grouped_by(parent, sort_by)
    sorted_children(parent).group_by { |child| child[sort_by] }.reject { |key, value| key.nil? }
  end

  private

  def sorted_items_without_navigation(items)
    items.reject { |i| i[:navigation] }.sort_by { |i| i[:title] }
  end

  def sorted_items_with_navigation(items)
    items.select { |i| i[:navigation] }.sort_by { |i| [i[:navigation], i[:title]] }
  end
end
