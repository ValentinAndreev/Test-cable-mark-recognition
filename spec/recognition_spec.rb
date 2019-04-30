# frozen_string_literal: true

require 'spec_helper'
require 'recognition'

RSpec.describe Recognition::Parser do
  let(:result) { described_class.new.parse_file('test.csv') }
  let(:marks) do
    [[{ 'mark' => nil }],
     [{ 'mark' => 'ПЭТД-180', 'voltage' => nil, 'execution' => nil, "standard"=>nil }],
     [{ 'mark' => 'ПЭТД-180', 'voltage' => nil, 'execution' => nil, "standard"=>nil }],
     [{ 'mark' => 'ПЭТВ-2', 'voltage' => nil, 'execution' => nil, "standard"=>"ТУ 16-705-110-79" }],
     [{ 'mark' => 'ПуГВ', 'voltage' => nil, 'execution' => nil, "standard"=>"ТУ 16-705.501-2010" }],
     [{ 'mark' => 'АПБ', 'voltage' => nil, 'execution' => nil, "standard"=>nil }],
     [{ 'mark' => 'ПуГВ', 'voltage' => nil, 'execution' => 'ХЛ', "standard"=>nil }],
     [{ 'mark' => 'ПуГВ', 'voltage' => '5 мВ', 'execution' => 'ХЛ', "standard"=>nil }],
     [{ 'mark' => 'ПуГВ', 'voltage' => '5.5 В', 'execution' => 'У', "standard"=>nil }],
     [{ 'mark' => 'ПуГВ', 'voltage' => '5,5 МВ;', 'execution' => 'В', "standard"=>"ГОСТ-12815-80" }]]
  end

  it 'right parsing all data' do
    expect(result).to match_array(marks)
  end
end
