# frozen_string_literal: true

# Main class where all cases are evaluated
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      product_filter(item)
      item.sell_in -= 1 if item.name != 'Sulfuras, Hand of Ragnaros'
    end
  end

  def product_filter(item)
    case item.name
    when '+5 Dexterity Vest', 'Elixir of the Mongoose'
      double_speed(item) # Pasa 1 dia
    when 'Aged Brie'
      cheese?(item)
    when 'Backstage passes to a TAFKAL80ETC concert'
      backstage?(item)
    when 'Conjured Mana Cake'
      cake?(item)
    end
  end

  def cheese?(item)
    return unless item.quality < 50

    item.quality += item.sell_in <= 0 ? 2 : 1
    item.quality = 50 if item.quality > 50
  end

  def backstage?(item)
    if item.sell_in <= 0
      item.quality = 0
    elsif item.sell_in <= 5
      item.quality += 3
    elsif item.sell_in <= 10
      item.quality += 2
    else
      item.quality += 1
    end
    item.quality = 50 if item.quality > 50
  end

  def double_speed(item)
    item.quality -= item.sell_in <= 0 ? 2 : 1
    item.quality = 0 if item.quality.negative?
  end

  def cake?(item)
    item.quality -= item.sell_in.negative? ? 4 : 2
    item.quality = 0 if item.quality.negative?
  end
end

# Class Item
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
