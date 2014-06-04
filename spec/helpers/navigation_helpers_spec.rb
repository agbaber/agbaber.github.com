require 'spec_helper'
require './lib/helpers/navigation_helpers'
require 'support/item_helper'

class NavigationHelpersTest
  include NavigationHelpers

  def initialize(item, items)
    @item = item
    @items = items
  end
end

describe NavigationHelpers do
  include ItemHelper

  describe '.is_active_if_home' do
    before do
      home_item_helper = NavigationHelpersTest.new(item_at('/'), nil)
      nonhome_item_helper = NavigationHelpersTest.new(item_at('/other/'), nil)

      @home_result = home_item_helper.is_active_if_home
      @nonhome_result = nonhome_item_helper.is_active_if_home
    end

    it "returns 'is-active' only if the current page is in that section" do
      @home_result.should eq 'is-active'
      @nonhome_result.should be_nil
    end
  end

  describe '.is_active_if_section' do
    before do
      section = '/section/'

      section_item_helper = NavigationHelpersTest.new(item_at("#{section}item/"), nil)
      nonsection_item_helper = NavigationHelpersTest.new(item_at('/other/item/'), nil)

      @section_result = section_item_helper.is_active_if_section(section)
      @nonsection_result = nonsection_item_helper.is_active_if_section(section)
    end

    it "returns 'is-active' only if the current page is in that section" do
      @section_result.should eq 'is-active'
      @nonsection_result.should be_nil
    end
  end

  describe '.section_breadcrumb_titles' do
    before do
      root = item_at('/', title: 'Root')
      section = item_at('/section/', title: 'Section')
      subsection = item_at('/section/subsection/', title: 'Subsection')
      subitem = item_at('/section/subsection/subitem', title: 'Subitem')
      items = Nanoc::ItemArray.new
      items.concat [root, section, subsection, subitem]

      @root_results = NavigationHelpersTest.new(root, items).section_breadcrumb_titles
      @section_results = NavigationHelpersTest.new(section, items).section_breadcrumb_titles
      @second_results = NavigationHelpersTest.new(subsection, items).section_breadcrumb_titles
      @third_results = NavigationHelpersTest.new(subitem, items).section_breadcrumb_titles

    end

    it 'shows breadcrumb titles up to the first level for items below that' do
      @root_results.should eq []
      @section_results.should eq []
      @second_results.should eq ['Section']
      @third_results.should eq ['Section', 'Subsection']
    end
  end

  describe '.section_navigation' do
    before do
      @section_head = item_at('/section/')
      items = Nanoc::ItemArray.new
      items << @section_head

      @navigation_helpers_test = NavigationHelpersTest.new(nil, items)
    end

    it 'renders the navigation layout using the item matching the section' do
      @navigation_helpers_test.expects(:render).with(anything, section: @section_head)
      @navigation_helpers_test.section_navigation '/section/'
    end
  end

  describe '.sorted_children' do
    before do
      @section_head = item_at('/section/')
      @ordered_item_1 = item_at('/section/item_1/', navigation: 1)
      @ordered_item_2 = item_at('/section/item_2/', navigation: 2)
      @unordered_item_1 = item_at('/section/item_unordered_1/', title: 'ABC')
      @unordered_item_2 = item_at('/section/item_unordered_2/', title: 'DEF')

      @section_head.children = Nanoc::ItemArray.new
      @section_head.children.concat [@ordered_item_2, @unordered_item_2, @unordered_item_1,
        @ordered_item_1]

      @navigation_helpers_test = NavigationHelpersTest.new(nil, nil)
      @result = @navigation_helpers_test.sorted_children(@section_head)
    end

    it 'returns the children of the item, sorted items first' do
      @result.should eq([@ordered_item_1, @ordered_item_2, @unordered_item_1, @unordered_item_2])
    end
  end
end
