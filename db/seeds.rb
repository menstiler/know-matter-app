# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.destroy_all
Teacher.destroy_all
Hobby.destroy_all
Review.destroy_all

emi = Student.create(name: "Emi", age: 30, email: "emi@gmail.com", profile_image: "asfa")
mendel = Student.create(name: "Mendel", age: 23, email: "mendel@gmail.com", profile_image: "safsd")

puts "creating teachers"
henry = Teacher.create(name: "Henry", bio: "great teacher", profile_image: "afd", hobby_id: 1)
jerry = Teacher.create(name: "Jerry", bio: "so so teacher", profile_image: "sdkjfn", hobby_id: 2)
puts "finished teachers"


Hobby.create(name: "Music", category: "Piano")
Hobby.create(name: "Art", category: "Painting")
puts "creating lessons"
Lesson.create(location: "East Village", time: "Saturdays at 10", student_id: mendel.id, teacher_id: henry.id)
Lesson.create(location: "Brooklyn", time: "Sundays at 5", student_id: emi.id, teacher_id: jerry.id)
puts "finished lessons"

Review.create(content: "Great teacher", rating: 3.5,  student_id: emi.id, teacher_id: henry.id)
Review.create(content: "Awesome teacher", rating: 5,  student_id: mendel.id, teacher_id: jerry.id)
