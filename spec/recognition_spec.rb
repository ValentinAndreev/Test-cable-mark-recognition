# frozen_string_literal: true

require 'spec_helper'
require 'recognition'

RSpec.describe Recognition::Parser do
  let(:result) { described_class.new.parse_file('test.csv') }
  let(:marks) do
    [[{"mark"=>nil}], [{"mark"=>"ПЭТД", "voltage"=>nil}], [{"mark"=>"ПЭТД", "voltage"=>nil}],
    [{"mark"=>"ПЭТВ", "voltage"=>nil}], [{"mark"=>"ПуГВ", "voltage"=>nil}], [{"mark"=>"АПБ", "voltage"=>nil}],
    [{"mark"=>"ПуГВ", "voltage"=>nil}], [{"mark"=>"ПуГВ", "voltage"=>"5 мВ"}], [{"mark"=>"ПуГВ", "voltage"=>"5.5 В"}],
    [{"mark"=>"ПуГВ", "voltage"=>"5,5 МВ;"}]]
  end

  it 'right parsing all marks' do
    expect(result).to match_array(marks)
  end
end
