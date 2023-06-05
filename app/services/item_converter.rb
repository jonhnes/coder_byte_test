# frozen_string_literal: true

# Class to converter the line in a item object
class ItemConverter
  attr_reader :data, :items

  def initialize(data)
    @data = data
    @items = []
  end

  def self.item_objects(data)
    new(data).item_objects
  end

  def item_objects
    data.each do |line|
      (_, amount, description, price) = line.match(/(\d)*\s(.*)\sat\s(\d*\.\d*)/).to_a
      @items << Item.new(description: description, price: price, amount: amount)
    end
    @items
  end
end
