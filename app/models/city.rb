class City < ApplicationRecord
  mount_uploader :cover, CityCoverUploader

  has_many :spots, dependent: :destroy
  has_and_belongs_to_many :keepers, class_name: "User"
  belongs_to :country

  validates :name, presence: true, uniqueness: true
  validates :country, presence: true
  # validates :cover, presence: true
  validates :keepers, presence: true

  def self.alphabetize
    order(name: :asc)
  end

  def self.for(user)
    user.admin? ? all : user.cities
  end

  def self.with_published_spots
    joins(:spots).where(spots: { status: :published }).distinct
  end
end
