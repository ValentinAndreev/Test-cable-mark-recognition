# frozen_string_literal: true

require 'spec_helper'
require 'recognition'

RSpec.describe Recognition::Parser do
  let(:result) { described_class.new.parse_file('test.csv') }
  let(:marks) do
    [{ 'mark' => nil },
     { 'mark' => 'ПЭТД-180', 'voltage' => nil, 'execution' => nil, 'standard' => nil, 'size' => '1x0,28', 'colors' => nil },
     { 'mark' => 'ПЭТД-180', 'voltage' => nil, 'execution' => nil, 'standard' => nil, 'size' => '1x0,28', 'colors' => nil },
     { 'mark' => 'ПЭТВ-2', 'voltage' => nil, 'execution' => nil, 'standard' => 'ТУ 16-705-110-79', 'size' => '0,950', 'colors' => nil },
     { 'mark' => 'ПуГВ', 'voltage' => nil, 'execution' => nil, 'standard' => 'ТУ 16-705.501-2010', 'size' => '1х6', 'colors' => %w[зеленый желтый] },
     { 'mark' => 'АПБ', 'voltage' => nil, 'execution' => nil, 'standard' => nil, 'size' => '5,20х12,50/0,45', 'colors' => nil },
     { 'mark' => 'ПуГВ', 'voltage' => nil, 'execution' => 'ХЛ', 'standard' => nil, 'size' => '2х16', 'colors' => nil },
     { 'mark' => 'ПуГВ', 'voltage' => %w[5 мВ], 'execution' => 'ХЛ', 'standard' => nil, 'size' => '2х16', 'colors' => nil },
     { 'mark' => 'ПуГВ', 'voltage' => %w[5.6 В], 'execution' => 'У', 'standard' => nil, 'size' => '2х16', 'colors' => nil },
     { 'mark' => 'ПуГВ', 'voltage' => %w[5.5 МВ], 'execution' => 'В', 'standard' => 'ГОСТ-12815-80', 'size' => '2х16', 'colors' => nil }]
  end

  it 'right parsing all data' do
    expect(result).to match_array(marks)
  end
end
