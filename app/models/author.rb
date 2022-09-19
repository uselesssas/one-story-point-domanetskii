class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true, length: { in: 2..100 }
end
