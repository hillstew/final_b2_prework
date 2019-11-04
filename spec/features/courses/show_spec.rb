require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I visit a course show page' do
    it 'I see the course name and all students sorted by grade' do
      hill = Student.create(name: "Hillary")
      gmoney = Student.create(name: "G$")
      zac = Student.create(name: "Zac")
      ryan = Student.create(name: "Ryan")

      comp_sci = Course.create(name: "Comp Sci")
      history = Course.create(name: "History")
      
      CourseStudent.create(student_id: zac.id, course_id: comp_sci.id, grade: 96)
      CourseStudent.create(student_id: hill.id, course_id: comp_sci.id, grade: 100)
      CourseStudent.create(student_id: ryan.id, course_id: comp_sci.id, grade: 94)
      CourseStudent.create(student_id: gmoney.id, course_id: comp_sci.id, grade: 98)

      visit course_path(comp_sci.id)

      expect(page).to have_content("Course - Comp Sci")
      expect(page).to_not have_content("History")

      within "#students-0" do
        expect(page).to have_content("Hillary - 100")
      end

      within "#students-1" do
        expect(page).to have_content("G$ - 98")
      end

      within "#students-3" do
        expect(page).to have_content("Ryan - 94")
      end

      within "#students-2" do
        expect(page).to have_content("Zac - 96")
      end
    end
  end
end