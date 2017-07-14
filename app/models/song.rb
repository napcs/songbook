class Song < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :lyrics, presence: true
end
