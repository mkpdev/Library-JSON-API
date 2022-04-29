50.times do
  Book.create!(title: Faker::Book.title, author: Faker::Book.author, genre: Faker::Book.genre, publisher: Faker::Book.publisher, cost: Faker::Commerce.price)
end
