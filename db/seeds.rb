# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



days = Date::DAYNAMES
times = ['9am - 10am','10am - 11am','11am - 12pm','1pm - 2pm','2pm - 3pm','3pm - 4pm','4pm - 5pm','5pm - 6pm','6pm - 7pm','7pm - 8pm']


Student.create(name: "Emi", age: 30, email: Faker::Internet.email, username: "emi", password: "123")
Student.create(name: "Mendel", age: 23, email: Faker::Internet.email, username: "mendel", password: "123")

Hobby.create(category: "Creative", name: "Music", subclass: "Piano")
Hobby.create(category: "Creative", name: "Music", subclass: "Saxophone")
Hobby.create(category: "Creative", name: "Music", subclass: "Piano")
Hobby.create(category: "Creative", name: "Art", subclass: "Painting")
Hobby.create(category: "Creative", name: "Art", subclass: "Graphic Design")
Hobby.create(category: "Creative", name: "Art", subclass: "Watercolor Painting")
Hobby.create(category: "Creative", name: "Art", subclass: "Drawing")
Hobby.create(category: "Tech", name: "Web Development", subclass: "Javascipt")
Hobby.create(category: "Tech", name: "Web Development", subclass: "Ruby on Rails")
Hobby.create(category: "Tech", name: "Web Development", subclass: "React")
Hobby.create(category: "Lifestyle", name: "Language", subclass: "French")
Hobby.create(category: "Lifestyle", name: "Language", subclass: "Russian")
Hobby.create(category: "Lifestyle", name: "Language", subclass: "Spanish")

Hobby.all.each_with_index do |hobby, index|
  Teacher.create(name: Faker::Name.name, bio: Faker::Quote.famous_last_words, hobby_id: rand(1..Hobby.all.length), location: Faker::Address.street_address, rates: rand(10..100), title: Faker::Job.title, username: "test#{index}", password: "123")
end


days.each do |day|
  times.each do |time|
    Timeslot.create(day: day, time: time, timeslot: "#{day}: #{time}")
  end
end

Teacher.all.each do |teacher|
  Review.create(content: Faker::Movies::HarryPotter.quote , rating: rand(1..5),  student_id: Student.first.id, teacher_id: teacher.id)
end
