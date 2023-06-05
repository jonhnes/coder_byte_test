# frozen_string_literal: true

# Class to save the item information
class Item
  attr_reader :description, :price, :amount, :taxes_applier

  def initialize(description:, price:, amount:)
    @description = description
    @price = price.to_f
    @amount = amount.to_i
    @taxes_applier = TaxApplier.new(self)
  end

  def imported?
    @description.include?('import')
  end

  def taxes_values
    amount * taxes_applier.taxes
  end

  def total_price
    amount * (price + taxes_applier.taxes)
  end
end
