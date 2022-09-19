5.times do
  @author = Author.create(name: FFaker::Book.author)

  5.times do
    Book.create(author_id: @author.id, title: FFaker::Book.title, shelf: Random.rand(10))
  end
end
