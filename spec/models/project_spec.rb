require "rails_helper"

RSpec.describe Project do
  let(:project) {Project.new}
  let(:task) {Task.new}

  it "considers a Project with no tasks to be done" do
    expect(project).to be_done
  end
  
  it "knows that a project with an incomplete task is not done" do
    project.tasks << task
    expect(project).to_not be_done
  end

  it "marks a project done if it's tasks are done" do
    project.tasks << task
    task.mark_completed
    expect(project).to be_done
  end
end