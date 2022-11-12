# frozen_string_literal: true

class Node
  attr_accessor :distance, :value, :previous

  def initialize(value)
    @distance = 100
    @value = value
    @previous = nil
  end
end

class Graphs
  def dfs(source, graph)
    stack = DataStructures::Stack.new
    stack.put(source)

    visited = []
    len = graph.length - 1

    loop do
      curr = stack.pop
      break if curr.nil?

      visited << curr unless visited.include? curr

      adjs =
        (0..len).to_a.select do |i|
          node = graph[curr][i]
          node == 1 && curr != i && !visited.include?(i)
        end

      adjs.each do |child|
        stack.put(child)
      end
    end

    visited
  end

  def bfs(source, graph)
    queue = DataStructures::Queue.new
    queue.put(source)

    visited = []
    len = graph.length - 1

    loop do
      curr = queue.pop
      break if curr.nil?

      visited << curr unless visited.include? curr

      adjs =
        (0..len).to_a.select do |i|
          graph[curr][i] == 1
        end

      adjs.each do |child|
        queue.put(child)
      end
    end

    visited
  end

  def shortest_path(source, destination, graph)
    pqueue = DataStructures::PriorityQueue.new

    unvisited = (0..graph.length - 1).to_a.map do |i|
      Node.new(i)
    end

    visited = []

    source_node = unvisited.find { |n| n.value == source }
    destination_node = unvisited.find { |n| n.value == destination }

    pqueue.put(source_node) if source_node.value != destination_node.value

    until unvisited.empty?
      node = pqueue.pop

      node.distance = 0 if node && node.value == source

      if node
        unvisited_neighbours = unvisited_neighbours(node, graph, unvisited)

        unvisited_neighbours.each do |unvisited_neighbour|
          tmp_distance = node.distance + graph[node.value][unvisited_neighbour.value]

          if tmp_distance < unvisited_neighbour.distance
            unvisited_neighbour.distance = tmp_distance
            unvisited_neighbour.previous = node
          end

          pqueue.put(unvisited_neighbour) unless pqueue.priority_queue.include?(unvisited_neighbour)
        end
      end

      visited << node if node
      unvisited = unvisited.select do |n|
        if node
          n.value != node.value
        else
          false
        end
      end
    end

    backtrack(destination_node).reverse
  end

  def backtrack(node)
    return [node.value] if node.previous.nil?

    prev = node.previous
    [node.value] + backtrack(prev)
  end

  def unvisited_neighbours(node, graph, unvisited)
    neighbours =
      (0..graph.length - 1).to_a.select do |n|
        graph[node.value][n] > 0
      end

    neighbours.map do |n|
      unvisited.find { |uv| uv.value == n }
    end.compact
  end
end
