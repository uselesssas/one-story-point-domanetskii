class Book < ApplicationRecord
  belongs_to :author

  validates :author_id, presence: true
  validates :title, presence: true, length: { in: 2..200 }
end
