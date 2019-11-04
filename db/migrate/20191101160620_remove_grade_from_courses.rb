class RemoveGradeFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :grade, :integer
  end
end
