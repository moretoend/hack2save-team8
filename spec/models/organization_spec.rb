require 'rails_helper'

RSpec.describe Organization, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cnpj) }
    it { should validate_presence_of(:phone) }
  end
end

