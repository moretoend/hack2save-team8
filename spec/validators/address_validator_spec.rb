require 'rails_helper'

RSpec.describe AddressValidator do
  subject(:address) { build(:address) }

  context 'when valid' do
    it { is_expected.to be_valid }
  end

  context 'when not valid' do
    it 'returns invalid' do
      address.country = nil

      expect(address).to_not be_valid
    end

    it 'set error on country' do
      address.country = nil
      address.valid?

      expected_errors = ["Can't be blank"]

      expect(address.errors[:country]).to match_array(expected_errors)
    end

    it 'set error on city' do
      address.city = nil
      address.valid?

      expected_errors = ["Can't be blank"]

      expect(address.errors[:city]).to match_array(expected_errors)
    end

    it 'set error on neighborhood' do
      address.neighborhood = nil
      address.valid?

      expected_errors = ["Can't be blank"]

      expect(address.errors[:neighborhood]).to match_array(expected_errors)
    end

    it 'set error on neighborhood' do
      address.street = nil
      address.valid?

      expected_errors = ["Can't be blank"]

      expect(address.errors[:street]).to match_array(expected_errors)
    end

    it 'set error on number' do
      address.number = nil
      address.valid?

      expected_errors = ["Can't be blank", 'Need to include a number']

      expect(address.errors[:number]).to match_array(expected_errors)
    end
  end
end

