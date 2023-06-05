# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Main' do
  subject(:main_start) { Main.start }

  let(:input_entry) { "2 book at 12.49\n" }

  before do
    allow(Main).to receive(:puts).with('Insert the data:').and_return(nil)
    allow(Main).to receive(:puts).with('result').and_return(nil)
    allow(Main).to receive(:gets).and_return(input_entry, "\n")
    allow(ItemConverter).to receive(:item_objects)
    allow(ItemPresenter).to receive(:items_result).and_return('result')
  end

  it 'calls ItemConverter' do
    subject
    expect(ItemConverter).to have_received(:item_objects).with([input_entry.chomp])
  end

  it 'calls ItemPresenter' do
    subject
    expect(Main).to have_received(:puts).with('result')
  end
end
