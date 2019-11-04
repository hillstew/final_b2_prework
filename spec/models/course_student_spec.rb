require 'rails_helper'

RSpec.describe CourseStudent, type: :model do
  describe "relationships" do
    it { should belong_to :student }
    it { should belong_to :course }
  end

  describe "validations" do
    it { should validate_presence_of :grade }
  end
end