class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name 
      when '+5 Dexterity Vest'
       # is_quality_negative?(item)
        double_speed(item) #Pasa 1 dia
      when 'Aged Brie'
        cheese?(item)
      when 'Elixir of the Mongoose'
        #is_quality_negative?(item)
        double_speed(item) #Pasa 1 dia
      when 'Backstage passes to a TAFKAL80ETC concert'
        backstage?(item)
      when 'Conjured Mana Cake'
        cake?(item)
      end
      item.sell_in -= 1 if item.name != "Sulfuras, Hand of Ragnaros"
    end
    
  end

  # def is_quality_negative?(item)
  #   if(!item.quality.negative?)
  #     item.quality -= 1
  #   end
  # end
   
  def cheese?(item)
    if item.quality < 50 
      item.quality += (item.sell_in <= 0) ? 2 : 1
      item.quality = 50 if item.quality > 50
    end 
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
    item.quality -= (item.sell_in <= 0) ? 2 : 1
    item.quality = 0 if item.quality < 0
  end
    
  def cake?(item)
    item.quality -= (item.sell_in < 0) ? 4 : 2
    item.quality = 0 if item.quality < 0
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
  
end