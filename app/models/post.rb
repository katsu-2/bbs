class Post < ApplicationRecord
  scope :recent, -> { order('created_at desc') }

  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 1000 }
end
