class Book < ApplicationRecord
  belongs_to :author

  validates :title, presence: true, length: { in: 2..200 }
end
