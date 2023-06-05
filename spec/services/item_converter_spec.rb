# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'ItemConverter' do
  describe '#item_objects' do
    subject(:item_objects) { ItemConverter.item_objects(data) }

    context 'when the product is food' do
      let(:data) do
        ['1 chocolate bar at 0.85']
      end

      it 'returns objects' do
        expect(item_objects).to include(an_instance_of(Item))
      end

      it 'returns the Item object with description' do
        expect(item_objects.first.description).to eq('chocolate bar')
      end

      it 'returns the Item object with amount' do
        expect(item_objects.first.amount).to eq(1)
      end

      it 'returns the Item object with price without taxes' do
        expect(item_objects.first.total_price).to eq(0.85)
      end
    end

    context 'when the product is medical products' do
      let(:data) do
        ['2 packet of headache pills at 9.75']
      end

      it 'returns objects' do
        expect(item_objects).to include(an_instance_of(Item))
      end

      it 'returns the Item object with description' do
        expect(item_objects.first.description).to eq('packet of headache pills')
      end

      it 'returns the Item object with amount' do
        expect(item_objects.first.amount).to eq(2)
      end

      it 'returns the Item object with price without taxes' do
        expect(item_objects.first.total_price).to eq(19.50)
      end
    end
  end
end
