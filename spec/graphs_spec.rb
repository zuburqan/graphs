# frozen_string_literal: true

RSpec.describe Graphs do
  it "traverses dfs" do
    expect(subject.dfs(0, default_graph)).to eq [0, 3, 5, 2, 1, 4]
  end

  it "traverses bfs" do
    expect(subject.bfs(0, default_graph)).to eq [0, 1, 2, 3, 4, 5]
  end

  it "traverses dfs disconnected graph with cycles" do
    graph = [
      [1, 1, 0],
      [1, 1, 0],
      [0, 0, 1]
    ]
    expect(subject.dfs(0, graph)).to eq [0, 1]
    expect(subject.dfs(1, graph)).to eq [1, 0]
    expect(subject.dfs(2, graph)).to eq [2]

    groups = (0..graph.length - 1).map do |i|
      subject.dfs(i, graph)
    end.uniq { |tuple| tuple.sort }

    expect(groups.count).to eq 2
  end

  it "finds the shortest path from source to destination" do
    graph = [
      [0, 4, 3, 0, 7, 0, 0],
      [4, 0, 6, 5, 0, 0, 0],
      [3, 6, 0, 11, 8, 0, 0],
      [0, 5, 11, 0, 2, 2, 10],
      [7, 0, 8, 2, 0, 0, 5],
      [0, 0, 0, 2, 0, 0, 3],
      [0, 0, 0, 10, 5, 3, 0]
    ]

    expect(subject.shortest_path(0, 5, graph)).to eq [0, 1, 3, 5]
  end

  def default_graph
    [
      [0, 1, 1, 1, 0, 0],
      [0, 0, 0, 0, 1, 0],
      [0, 0, 0, 0, 0, 1],
      [0, 0, 0, 0, 0, 1],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0]
    ]
  end
end
