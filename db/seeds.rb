# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



days = Date::DAYNAMES
times = ['9am - 10am','10am - 11am','11am - 12pm','1pm - 2pm','2pm - 3pm','3pm - 4pm','4pm - 5pm','5pm - 6pm','6pm - 7pm','7pm - 8pm']

Student.create(name: "Emi", age: 30, email: "emi@gmail.com", username: "test", password: "123")
Student.create(name: "Mendel", age: 23, email: "mendel@gmail.com", username: "test2", password: "123")

Hobby.create(category: "Creative", name: "Music", subclass: "Piano")
Hobby.create(category: "Creative", name: "Art", subclass: "Painting")
Hobby.create(category: "Tech", name: "Web Development", subclass: "Ruby")
Hobby.create(category: "Lifestyle", name: "Language", subclass: "French")


Teacher.create(name: "Henry", bio: "great teacher", hobby_id: Hobby.first.id, location: "Bushwick", rates: 30, title: "Piano teacher for grades 1-6", username: "test2", password: "123")
Teacher.create(name: "Amy", bio: "20 years experience as an art teacher", hobby_id: Hobby.last.id, location: "East Village", rates: 40, title: "Learn how to paint in oil like a master!", username: "test3", password: "123")

days.each do |day|
  times.each do |time|
    Timeslot.create(day: day, time: time, timeslot: "#{day}: #{time}")
  end
end

Review.create(content: "Great teacher", rating: 3,  student_id: Student.first.id, teacher_id: Teacher.first.id)
Review.create(content: "Awesome teacher", rating: 5,  student_id: Student.last.id, teacher_id: Teacher.last.id)
