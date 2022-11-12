# frozen_string_literal: true

module DataStructures
  class Queue
    attr_accessor :queue

    def initialize
      @queue = []
    end

    def put(element)
      @queue << element
    end

    def pop
      @queue.shift
    end
  end
end
