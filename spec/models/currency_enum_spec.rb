require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::CurrencyEnum do
  describe '.all_vars' do
    it 'returns all valid enum values' do
      vars = LunchMoney::CurrencyEnum.all_vars
      expect(vars).to include('usd', 'eur', 'gbp', 'jpy', 'cad', 'aud')
      expect(vars.length).to be > 100
    end

    it 'returns frozen values' do
      expect(LunchMoney::CurrencyEnum.all_vars).to be_frozen
    end
  end

  describe 'constants' do
    it 'defines USD' do
      expect(LunchMoney::CurrencyEnum::USD).to eq('usd')
    end

    it 'defines EUR' do
      expect(LunchMoney::CurrencyEnum::EUR).to eq('eur')
    end

    it 'defines GBP' do
      expect(LunchMoney::CurrencyEnum::GBP).to eq('gbp')
    end

    it 'defines JPY' do
      expect(LunchMoney::CurrencyEnum::JPY).to eq('jpy')
    end

    it 'defines CAD' do
      expect(LunchMoney::CurrencyEnum::CAD).to eq('cad')
    end

    it 'defines BTC' do
      expect(LunchMoney::CurrencyEnum::BTC).to eq('btc')
    end
  end

  describe '.build_from_hash' do
    it 'returns the value for a valid enum string' do
      expect(LunchMoney::CurrencyEnum.build_from_hash('usd')).to eq('usd')
    end

    it 'returns the value for another valid enum string' do
      expect(LunchMoney::CurrencyEnum.build_from_hash('eur')).to eq('eur')
    end

    it 'raises for an invalid enum string' do
      expect {
        LunchMoney::CurrencyEnum.build_from_hash('invalid_currency')
      }.to raise_error(RuntimeError, /Invalid ENUM value/)
    end
  end
end
