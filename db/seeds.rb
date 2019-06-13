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

Student.create(name: "Emi", age: 30, email: "emi@gmail.com", profile_image: "asfa")
Student.create(name: "Mendel", age: 23, email: "mendel@gmail.com", profile_image: "safsd")

Teacher.create(name: "Henry", bio: "great teacher", profile_image: "afd", hobby_id: Hobby.first.id)
Teacher.create(name: "Jerry", bio: "so so teacher", profile_image: "sdkjfn", hobby_id: Hobby.last.id)

Hobby.create(name: "Music", category: "Piano")
Hobby.create(name: "Art", category: "Painting")

Lesson.create(location: "East Village", time: "Saturdays at 10", student_id: Student.first.id, teacher_id: Teacher.first.id)
Lesson.create(location: "Brooklyn", time: "Sundays at 5", student_id: Student.last.id, teacher_id: Teacher.last.id)

Review.create(content: "Great teacher", rating: 3.5,  student_id: Student.first.id, teacher_id: Teacher.first.id)
Review.create(content: "Awesome teacher", rating: 5,  student_id: Student.last.id, teacher_id: Teacher.last.id)
