# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo' 
    end 

    it 'structure of an item' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to be_a(String) 
      expect(items[0].sell_in).to be_a(Integer)
      expect(items[0].quality).to be_a(Integer)

    end 

    it '+5 dextery and Elixir Moongose case' do
      items = [Item.new('+5 Dexterity Vest', 10, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 9
      expect(items[0].quality).to eq 19
    end

    it '+5 dextery and Elixir Moongose case sell_in are negative' do
      items = [Item.new('+5 Dexterity Vest', -1, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq -2
      expect(items[0].quality).to eq 18
    end

    it 'Aged Brie case' do
      items = [Item.new('Aged Brie', 2, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 1
      expect(items[0].quality).to eq 1
    end

    it 'Aged Brie case quality greater than 50' do
      items = [Item.new('Aged Brie', -1, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq -2
      expect(items[0].quality).to eq 50
    end

    it 'Sulfuras, Hand of Ragnaros' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 0
      expect(items[0].quality).to eq 80
    end

    it 'Backstage passes to a TAFKAL80ETC concert, case of 10 days or less' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 9, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 8
      expect(items[0].quality).to eq 22
    end
    
    it 'Backstage passes to a TAFKAL80ETC concert, case of 5 days or less days' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 3
      expect(items[0].quality).to eq 23
    end

    it 'Backstage passes to a TAFKAL80ETC concert, case of negative day' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', -1, 5)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq -2
      expect(items[0].quality).to eq 0
    end

    it 'Conjured Mana Cake' do
      items = [Item.new('Conjured Mana Cake', 3, 6)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 2
      expect(items[0].quality).to eq 4
    end
    
    it 'Conjured Mana Cake is rotten' do
      items = [Item.new('Conjured Mana Cake', -1, 6)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq -2
      expect(items[0].quality).to eq 2
    end
  end
end
