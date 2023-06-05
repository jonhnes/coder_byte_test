# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'ItemPresenter' do
  subject(:presenter) { ItemPresenter.items_result(items) }

  let(:item1) { Item.new(description: 'book', price: '12.49', amount: 2) }
  let(:item2) { Item.new(description: 'music CD', price: '14.99', amount: 1) }
  let(:item3) { Item.new(description: 'chocolate bar', price: '0.85', amount: 1) }
  let(:items) { [item1, item2, item3] }

  it 'returns an string with item1 results details ' do
    expect(presenter).to include('2 book: 24.98')
  end

  it 'returns an string with item2 results details ' do
    expect(presenter).to include('1 music CD: 16.49')
  end

  it 'returns an string with item3 results details ' do
    expect(presenter).to include('1 chocolate bar: 0.85')
  end

  it 'returns sales taxes' do
    expect(presenter).to include('Sales Taxes: 1.50')
  end

  it 'returns total' do
    expect(presenter).to include('Total: 42.32')
  end
end
