30.times do
  Course.create!({
                   title: Faker::Educator.course_name,
                   description: Faker::TvShows::GameOfThrones.quotes,
                   short_description: Faker::Quote.famous_last_words,
                   language: Faker::ProgrammingLanguage.name,
                   level: 'Beginner',
                   price: Faker::Number.between(from: 100, to: 1000),
                   user_id: User.first.id
                 })
end
