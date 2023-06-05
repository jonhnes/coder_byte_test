# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'TaxApplier' do
  subject(:tax_applier) { TaxApplier.new(object) }

  context 'when item is not taxed' do
    let(:object) { Item.new(description: 'chocolate bar', price: '0.85', amount: 1) }

    it { expect(tax_applier.taxes).to eq(0) }
  end

  context 'when is an imported and special item' do
    let(:object) { Item.new(description: 'imported box of chocolates', price: '11.25', amount: 1) }

    it { expect(tax_applier.taxes).to eq(0.60) }
  end

  context 'when is not a special and not imported item' do
    let(:object) { Item.new(description: 'bottle of perfume', price: '18.99', amount: 1) }

    it { expect(tax_applier.taxes).to eq(1.9) }
  end

  context 'when is an imported and not special item' do
    let(:object) { Item.new(description: 'imported bottle of perfume', price: '27.99', amount: 1) }

    it { expect(tax_applier.local_tax).to eq(2.80) }
    it { expect(tax_applier.import_tax).to eq(1.40) }
    it { expect(tax_applier.taxes).to eq(4.20) }
  end
end
