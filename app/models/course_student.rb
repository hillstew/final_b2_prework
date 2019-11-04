class CourseStudent < ApplicationRecord
  validates_presence_of :grade
  
  belongs_to :student
  belongs_to :course

  def name
    Student.find(self.student_id).name
  end
end