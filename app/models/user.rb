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


  def valid_profile?
    self.fullname.present? && self.document_number? && self.gender.present?
  end


  def accept_subscriptions
    self.subscriptions.with_status(:accepted).count
  end

  def denied_subscriptions
    self.subscriptions.with_status(:accepted).count
  end

  def closed_subscriptions
    self.subscriptions.with_status(:accepted).count
  end

  def canceled_subscriptions
    self.subscriptions.with_status(:canceled).count
  end

  def avg_grade
    sum = self.subscriptions.joins(:review).sum("reviews.volunteer_grade")
    subscriptions_count = self.subscriptions.with_status(:closed).count
    sum / subscriptions_count
  end
end
