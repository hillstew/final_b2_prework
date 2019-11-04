require 'rails_helper'

RSpec.describe "As a user" do
  describe "When I visit a student show page" do
    it "I see the student's name - and all their courses with their grade" do 
      hill = Student.create(name: "Hillary")
      gmoney = Student.create(name: "G$")

      comp_sci = Course.create(name: "Comp Sci")
      history = Course.create(name: "History")
      
      CourseStudent.create(student_id: hill.id, course_id: comp_sci.id, grade: 100)
      CourseStudent.create(student_id: hill.id, course_id: history.id, grade: 99)
      CourseStudent.create(student_id: gmoney.id, course_id: history.id, grade: 99)
      CourseStudent.create(student_id: gmoney.id, course_id: comp_sci.id, grade: 90)

      visit student_path(hill.id)

      expect(page).to have_content("Name: Hillary")
      
      within "#courses-#{hill.id}" do
        expect(page).to have_content("Comp Sci - 100")
        expect(page).to have_content("History - 99")
      end

      visit student_path(gmoney.id)

      expect(page).to have_content("Name: G$")
      
      within "#courses-#{gmoney.id}" do
        expect(page).to have_content("Comp Sci - 90")
        expect(page).to have_content("History - 99")
      end
    end
  end
end