# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hill = Student.create(name: "Hillary")
gmoney = Student.create(name: "G$")
zac = Student.create(name: "Zac")
ryan = Student.create(name: "Ryan")

comp_sci = Course.create(name: "Comp Sci")
history = Course.create(name: "History")

CourseStudent.create(student_id: hill.id, course_id: comp_sci.id, grade: 100)
CourseStudent.create(student_id: hill.id, course_id: history.id, grade: 99)
CourseStudent.create(student_id: gmoney.id, course_id: comp_sci.id, grade: 90)
CourseStudent.create(student_id: gmoney.id, course_id: history.id, grade: 90)
CourseStudent.create(student_id: zac.id, course_id: comp_sci.id, grade: 80)
CourseStudent.create(student_id: zac.id, course_id: history.id, grade: 80)
CourseStudent.create(student_id: ryan.id, course_id: comp_sci.id, grade: 85)
CourseStudent.create(student_id: ryan.id, course_id: history.id, grade: 85)
