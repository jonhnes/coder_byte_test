# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Item' do
  describe '#imported?' do
    subject { Item.new(description: description, price: 9.9, amount: 2).imported? }

    context 'when has import word on the description' do
      let(:description) { 'imported box of chocolates' }

      it { is_expected.to be(true) }
    end

    context 'when has not the import word on the description' do
      let(:description) { 'box of chocolates' }

      it { is_expected.to be(false) }
    end
  end

  describe '#taxes_values' do
    let(:item) { Item.new(description: 'imported box of chocolates', price: 9.9, amount: 2) }
    let(:taxes) { 3.22 }
    let(:taxes_applier) { instance_double(TaxApplier, taxes: taxes) }

    subject { item.taxes_values }

    before do
      allow(TaxApplier).to receive(:new).and_return(taxes_applier)
    end

    context 'when has import word on the description' do
      it { is_expected.to be(item.amount * taxes) }
    end
  end

  describe '#total_price' do
    let(:item) { Item.new(description: 'imported box of chocolates', price: 9.9, amount: 2) }
    let(:taxes) { 3.22 }
    let(:taxes_applier) { instance_double(TaxApplier, taxes: taxes) }

    subject { item.total_price }

    before do
      allow(TaxApplier).to receive(:new).and_return(taxes_applier)
    end

    context 'when has import word on the description' do
      it { is_expected.to be(item.amount * (item.price + taxes)) }
    end
  end
end
