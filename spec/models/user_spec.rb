require 'rails_helper'

RSpec.describe User, type: :model do
  it 'create a valid user' do
    user = create(:user)
    expect(user).to be_valid
  end

  it { is_expected.to have_db_column :document_number }
  it { is_expected.to have_db_column :fullname }
  it { is_expected.to have_db_column :gender }
  it { is_expected.to enumerize(:gender).in(:male, :female) }

  it "must include Gravtastic" do
    expect(User).to include Gravtastic
  end

end
