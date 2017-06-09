class User < ApplicationRecord
  extend Enumerize
  include Gravtastic

  has_many :organizations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :subscriptions
  has_many :organizations
  has_many :jobs, through: :organizations

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

end
