# A Binary Search Tree implementation in Ruby
module AndelaBSTProject
  # The class node to preform actions on a node
  class Node
    attr_accessor :left, :right, :value, :parent

    def initialize(v, parent = nil)
    end

    def insert(*v)
    end

    def get(v)
    end

    def to_s
    end

    def to_a
    end

    def push_left(v, value)
    end

    def push_right(v, value)
    end
  end
  # A class to initialize the values of an empty node
  class EmptyNode
    def to_a
    end

    def get(*)
    end

    def insert(*)
    end

    def to_s
    end
  end
end
