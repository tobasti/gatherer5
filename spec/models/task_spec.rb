require "rails_helper"

RSpec.describe Task do
  let(:task) {Task.new}

  it "is not completed when newly created" do
    expect(task).not_to be_complete
  end

  it "allows us to complete a task" do
    task.mark_completed
    expect(task).to be_complete
  end
end
