class MemoryList < ApplicationRecord
  belongs_to :user
  has_many :compositions, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
