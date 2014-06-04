module ItemHelper
  def item_at(identifier, attributes = {})
    Nanoc::Item.new '', attributes, identifier
  end
end
