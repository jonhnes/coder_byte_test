# frozen_string_literal: true

# Class to calculate applied to the item
class TaxApplier
  NON_TAXED_ITEMS = %w[book chocolate pills].freeze

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def taxes
    special_round(local_tax + import_tax)
  end

  def local_tax
    taxed = NON_TAXED_ITEMS.none? { |non_taxed_item| item.description.include?(non_taxed_item) }
    taxed ? special_round(item.price * 0.1) : 0
  end

  def import_tax
    taxed = item.description.include?('import')
    taxed ? special_round(item.price * 0.05) : 0
  end

  private

  def special_round(number)
    ((number / 0.05).ceil * 0.05).round(2)
  end
end
