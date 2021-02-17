class Memory < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :emotion, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 100 }
end
