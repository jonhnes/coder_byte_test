# frozen_string_literal: true

# Class to generate the result from user data
class ItemPresenter
  def self.items_result(items)
    result = ''
    items.each do |item|
      result += "#{item.amount} #{item.description}: #{format('%.2f', item.total_price)}\n"
    end
    result += "Sales Taxes: #{format('%.2f', items.sum(&:taxes_values))}\n"
    result + "Total: #{format('%.2f', items.sum(&:total_price))}"
  end
end
