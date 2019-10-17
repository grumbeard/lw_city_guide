class City < ApplicationRecord
  mount_uploader :cover, CityCoverUploader

  has_many :spots
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true
  validates :country, presence: true
  validates :cover, presence: true

  def self.alphabetize
    order(name: :asc)
  end
end
