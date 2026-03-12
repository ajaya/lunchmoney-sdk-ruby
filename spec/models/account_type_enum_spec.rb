require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::AccountTypeEnum do
  describe '.all_vars' do
    it 'returns all valid enum values' do
      expected = %w[
        cash credit cryptocurrency employee\ compensation investment
        loan other\ liability other\ asset real\ estate vehicle
      ]
      expect(LunchMoney::AccountTypeEnum.all_vars).to match_array(expected)
    end

    it 'returns frozen values' do
      expect(LunchMoney::AccountTypeEnum.all_vars).to be_frozen
    end
  end

  describe 'constants' do
    it 'defines CASH' do
      expect(LunchMoney::AccountTypeEnum::CASH).to eq('cash')
    end

    it 'defines CREDIT' do
      expect(LunchMoney::AccountTypeEnum::CREDIT).to eq('credit')
    end

    it 'defines INVESTMENT' do
      expect(LunchMoney::AccountTypeEnum::INVESTMENT).to eq('investment')
    end
  end

  describe '.build_from_hash' do
    it 'returns the value for a valid enum string' do
      expect(LunchMoney::AccountTypeEnum.build_from_hash('cash')).to eq('cash')
    end

    it 'raises for an invalid enum string' do
      expect {
        LunchMoney::AccountTypeEnum.build_from_hash('invalid_type')
      }.to raise_error(RuntimeError, /Invalid ENUM value/)
    end
  end
end
