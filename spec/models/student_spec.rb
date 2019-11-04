require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "relationships" do
    it { should have_many :course_students }
    it { should have_many(:courses).through(:course_students) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "methods" do
    it "should return the students grade" do
      hill = Student.create(name: "Hillary")
      gmoney = Student.create(name: "G$")
      
      comp_sci = Course.create(name: "Comp Sci")
      
      CourseStudent.create(student_id: hill.id, course_id: comp_sci.id, grade: 100)
      CourseStudent.create(student_id: gmoney.id, course_id: comp_sci.id, grade: 90)

      actual = hill.grade(comp_sci.id)

      expect(actual).to eq(100)
    end
  end
end