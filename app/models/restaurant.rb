class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, exclusion: { in: %w[neptunian], message: '`%<value>s` is not a valid category' }
end
