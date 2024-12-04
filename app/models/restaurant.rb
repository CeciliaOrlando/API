class Restaurant < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy  # This ensures that comments are deleted if the restaurant is deleted.
  validates :name, presence: true
  validates :address, presence: true
end
