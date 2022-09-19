FactoryBot.define do
  factory :book do
    # association :author
    author_id { (create :author).id }
    title { FFaker::Book.title }
    genre { FFaker::Book.genre }
    shelf { Random.rand(10) }
  end
end
