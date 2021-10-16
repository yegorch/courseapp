User.create!(email: "admin2@example.com", password: "admin2@example.com", password_confirmation: "admin@example.com", confirmed_at: Time.now)

40.times do
  Course.create!([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote
    user_id: User.first.id
  }])
end
