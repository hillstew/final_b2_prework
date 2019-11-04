require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "relationships" do
    it { should have_many :course_students }
    it { should have_many(:students).through(:course_students) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "methods" do
    it "should return the students sorted by grade - H -> L" do
      hill = Student.create(name: "Hillary")
      gmoney = Student.create(name: "G$")
      zac = Student.create(name: "Zac")
      ryan = Student.create(name: "Ryan")

      comp_sci = Course.create(name: "Comp Sci")

      hill_cs = comp_sci.course_students.create(student_id: hill.id, grade: 100.0)
      gmoney_cs = comp_sci.course_students.create(student_id: gmoney.id, grade: 90.0)
      zac_cs = comp_sci.course_students.create(student_id: zac.id, grade: 80.0)
      ryan_cs = comp_sci.course_students.create(student_id: ryan.id, grade: 85.0)

      actual = comp_sci.sorted_grades
      expected = [hill_cs, gmoney_cs, ryan_cs, zac_cs]

      expect(actual).to eq(expected)
    end
  end
end