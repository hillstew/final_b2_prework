class Student < ApplicationRecord
  validates_presence_of :name

  has_many :course_students
  has_many :courses, through: :course_students

  def grade(id)
    course_students.find_by(course_id: id).grade
  end
end