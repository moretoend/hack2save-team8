class User < ApplicationRecord
  extend Enumerize
  include Gravtastic
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :subscriptions
  has_many :organizations, dependent: :destroy
  has_many :jobs, through: :organizations
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  validates_associated :address

  enumerize :gender, in: [:male, :female]
  gravtastic size: 120

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
      user.image = auth.info.image
    end
  end


  def valid_profile?
    self.fullname.present? && self.fullname.document_number? && self.gender.present?
  end

end
