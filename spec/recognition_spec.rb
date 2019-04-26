# frozen_string_literal: true

require 'spec_helper'
require 'recognition'

RSpec.describe Recognition::Parser do
  let(:result) { described_class.new.parse_file('test.csv') }
  let(:marks) do
    [{ 'mark' => nil }, { 'mark' => 'ПЭТД' }, { 'mark' => 'ПЭТД' }, { 'mark' => 'ПЭТВ' },
     { 'mark' => 'ПуГВ' }, { 'mark' => 'АПБ' }, { 'mark' => 'ПуГВ' }]
  end

  it 'right parsing all marks' do
    expect(result).to match_array(marks)
  end
end
