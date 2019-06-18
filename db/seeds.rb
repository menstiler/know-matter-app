# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



days = Date::DAYNAMES
times = ['9am - 10am','10am - 11am','11am - 12pm','1pm - 2pm','2pm - 3pm','3pm - 4pm','4pm - 5pm','5pm - 6pm','6pm - 7pm','7pm - 8pm']

Student.create(name: "Emi", age: 30, email: "emi@gmail.com")
Student.create(name: "Mendel", age: 23, email: "mendel@gmail.com")

Hobby.create(category: "Creative", name: "Music", subclass: "Piano", image_url: "https://c.stocksy.com/a/gOf700/z9/1827430.jpg?1560798036")
Hobby.create(category: "Creative", name: "Art", subclass: "Painting", image_url: "https://coursehorse.imgix.net/images/course/101/main/paint_along_nyc_56af08c68f0a2.png?auto=format%2Cenhance%2Ccompress&crop=entropy&fit=crop&h=220&ixlib=php-1.2.1&q=90&w=330")
Hobby.create(category: "Tech", name: "Web Development", subclass: "Ruby", image_url: "https://digitaldefynd.com/wp-content/uploads/2018/01/best-free-web-development-courses-training-tutorials-and-certifications.jpg")
Hobby.create(category: "Lifestyle", name: "Language", subclass: "French", image_url: "https://learnatcentral.org/wp-content/uploads/2016/01/Page-Header-Language-French-300x200.jpg")


Teacher.create(name: "Henry", bio: "great teacher", hobby_id: 1, location: "Bushwick", rates: 30, title: "Piano teacher for grades 1-6")
Teacher.create(name: "Amy", bio: "20 years experience as an art teacher", hobby_id: 2, location: "East Village", rates: 40, title: "Learn how to paint in oil like a master!")

days.each do |day|
  times.each do |time|
    Timeslot.create(day: day, time: time, timeslot: "#{day}: #{time}")
  end
end

Booking.create(status: "available", timeslot_id: 1, teacher_id: 1)
Booking.create(status: "available", timeslot_id: 2, teacher_id: 2)

Lesson.create(location: "East Village", time: "Saturdays at 10", student_id: Student.first.id, teacher_id: Teacher.first.id)
Lesson.create(location: "Brooklyn", time: "Sundays at 5", student_id: Student.last.id, teacher_id: Teacher.last.id)

Review.create(content: "Great teacher", rating: 3,  student_id: Student.first.id, teacher_id: Teacher.first.id)
Review.create(content: "Awesome teacher", rating: 5,  student_id: Student.last.id, teacher_id: Teacher.last.id)
