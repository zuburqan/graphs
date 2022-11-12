# frozen_string_literal: true

module DataStructures
  class Stack
    attr_accessor :stack

    def initialize
      @stack = []
    end

    def put(element)
      @stack << element
    end

    def pop
      @stack.pop
    end
  end
end
