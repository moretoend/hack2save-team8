require 'rails_helper'

RSpec.describe Job, type: :model do

  it { is_expected.to belong_to :organization }
  it { is_expected.to have_many :subscriptions }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :kind }
  it { is_expected.to validate_presence_of :places }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :start_date }
  it { is_expected.to validate_presence_of :end_date }

end
