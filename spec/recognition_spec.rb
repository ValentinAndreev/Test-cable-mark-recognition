# frozen_string_literal: true

require 'spec_helper'
require 'recognition'

RSpec.describe Recognition::Parser do
  let(:result) { described_class.new.parse_file('test.csv') }
  let(:marks) do
    [[{ 'mark' => nil }],
     [{ 'mark' => 'ПЭТД-180', 'voltage' => nil, 'execution' => nil }],
     [{ 'mark' => 'ПЭТД-180', 'voltage' => nil, 'execution' => nil }],
     [{ 'mark' => 'ПЭТВ-2', 'voltage' => nil, 'execution' => nil }],
     [{ 'mark' => 'ПуГВ', 'voltage' => nil, 'execution' => nil }],
     [{ 'mark' => 'АПБ', 'voltage' => nil, 'execution' => nil }],
     [{ 'mark' => 'ПуГВ', 'voltage' => nil, 'execution' => 'ХЛ' }],
     [{ 'mark' => 'ПуГВ', 'voltage' => '5 мВ', 'execution' => 'ХЛ' }],
     [{ 'mark' => 'ПуГВ', 'voltage' => '5.5 В', 'execution' => 'У' }],
     [{ 'mark' => 'ПуГВ', 'voltage' => '5,5 МВ;', 'execution' => 'В' }]]
  end

  it 'right parsing all data' do
    expect(result).to match_array(marks)
  end
end
