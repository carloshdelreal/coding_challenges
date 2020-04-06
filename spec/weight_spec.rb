# frozen_string_literal: true

require './leet/weight'

RSpec.describe Weighcalc do
  describe 'weight' do
    it 'pass' do
      per = Weighcalc.new
      expect(per.solve(0,1,2)),to eq(2)