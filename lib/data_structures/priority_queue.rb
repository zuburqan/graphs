# frozen_string_literal: true

module DataStructures
  class PriorityQueue
    attr_accessor :priority_queue

    def initialize
      @priority_queue = []
    end

    def put(node)
      @priority_queue << node
      @priority_queue.sort_by! { |n| n.distance }
    end

    def pop
      @priority_queue.shift
    end
  end
end
