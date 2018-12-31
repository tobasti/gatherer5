require "rails_helper"

RSpec.describe Task do
  describe "completion" do
    let(:task) {Task.new}

    it "is not completed when newly created" do
      expect(task).not_to be_complete
    end

    it "allows us to complete a task" do
      task.mark_completed
      expect(task).to be_complete
    end
  end

  describe "velocity" do
    let (:task) { Task.new(size: 3) }

    it "does not count an incomplete task towards velocity" do
      expect(task).not_to be_a_part_of_velocity
      expect(task.points_towards_velocity).to eq(0)
    end

    it "counts a recently completed task towards velocity" do
      task.mark_completed(1.day.ago)
      expect(task).to be_a_part_of_velocity
      expect(task.points_towards_velocity).to eq(3)
    end

    it "does not count a long-ago completed task towards velocity" do
      task.mark_completed(6.month.ago)
      expect(task).not_to be_a_part_of_velocity
      expect(task.points_towards_velocity).to eq(0)
    end
  end
end
