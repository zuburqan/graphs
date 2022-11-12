# frozen_string_literal: true

RSpec.describe DataStructures::Stack do
  it "initializes an empty stack" do
    stack = subject
    expect(stack.stack).to eq []
  end

  it "adds element at top of the stack" do
    stack = subject
    stack.put(10)
    stack.put(12)

    expect(stack.stack).to eq [10, 12]
  end

  it "pops the top most element from the stack" do
    stack = subject
    stack.put(10)
    stack.put(12)

    expect stack.pop == 12
    expect(stack.stack).to eq [10]
  end
end
