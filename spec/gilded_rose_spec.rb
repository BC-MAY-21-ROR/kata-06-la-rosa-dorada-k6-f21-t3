# frozen_string_literal: true

require_relative '../ruby/gilded_rose'
# require File.join(File.dirname(__FILE__), '../ruby/gilded_rose')

RSpec.describe GildedRose do
  # Definir las variables
  let(:foo) { Item.new('foo', 0, 0) }
  let(:aged_brie) { Item.new('Aged Brie', 3, 40) }
  let(:backstage) { Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 49) }
  let(:sulfuras) { Item.new('Sulfuras, Hand of Ragnaros', 0, 80) }
  let(:mana_cake) { Item.new('Conjured Mana Cake', -1, 3) }
  let(:elixir) { Item.new('Elixir of the Mongoose', -1, 1) }
  let(:gilded_aged_brie) { GildedRose.new(aged_brie) }
  let(:gilded_backstage) { GildedRose.new(backstage) }
  let(:gilded_sulfuras) { GildedRose.new(sulfuras) }
  let(:gilded_mana_cake) { GildedRose.new(mana_cake) }
  let(:gilded_elixir) { GildedRose.new(elixir) }

  describe '#update_quality' do
    it 'does not change the name' do
      expect(foo.name).to eq 'foo'
    end

    it 'Cheese method' do
      gilded_aged_brie.cheese?(aged_brie)
      expect(aged_brie.quality).to eq 41
    end

    it 'Backstage method' do
      gilded_backstage.backstage?(backstage)
      expect(backstage.quality).to eq 50
    end

    it 'Sulfuras case' do
      expect(sulfuras.sell_in).to eq 0
      expect(sulfuras.quality).to eq 80
    end

    it 'Value of cake is positve' do
      gilded_mana_cake.cake?(mana_cake)
      expect(mana_cake.quality).to eq 0
    end

    it 'Double_speed method' do
      gilded_elixir.double_speed(elixir)
      expect(elixir.quality).to eq 0
    end
  end

end
