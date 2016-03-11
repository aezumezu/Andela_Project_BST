# A Binary Search Tree implementation in Ruby
# Introduced funcions to help insert items to the tree and
# print the tree structure.
module AndelaBSTProject
  # The class node to preform actions on a node
  class Node
    attr_accessor :left, :right, :value, :parent, :left_child, :right_child

    def initialize(val = nil, parent = nil)
      @value = val
      @left = EmptyNode.new
      @right = EmptyNode.new
      @parent = parent || "root"
      @left_child = "nil"
      @right_child = "nil"
    end

    def insert(key)
      if @value < key
        push_right(key, @value)
      elsif @value > key
        push_left(key, @value)
      else
        false # the value is already present
      end
    end

    # Returns the value at a node along with its parent
    # and children if they exist.
    def get(key)
      if @value > key
        @left.get(key)
      elsif @value < key
        @right.get(key)
      elsif @value == key
        getnodes # the current node is equal to the value
      else
        return nil
      end
    end

    def getnodes
      left.to_s
      right.to_s
      puts "(#{left_child} => (#{value}) <= #{right_child}) => #{parent}"
    end

    def to_s
      # Prints the nodes in the format
      # (left_child => (node_value) <= right_child) => parent_value
      getnodes
    end

    def push_left(key, value)
      if @left.insert(key) != false
        @left.insert(key)
      else
        @left_child = key
        self.left = Node.new(key, value)
        # puts "The left child of #{value} is #{left_child}"
      end
    end

    def push_right(key, value)
      if @right.insert(key) != false
        @right.insert(key)
      else
        @right_child = key
        self.right = Node.new(key, value)
        # puts "The right child of #{value} is #{right_child}"
      end
    end

    def get_min
      if left.get_min != false
        return left.get_min
      else
        return value
      end
    end

    def get_max
      if right.get_max != false
        return right.get_max
      else
        return value
      end
    end
  end
  # A class to initialize the values of an empty node
  class EmptyNode
    def get(*)
      false
    end

    def get_min
      false
    end

    def get_max
      false
    end

    def insert(*)
      false
    end

    def to_s
      "nil"
    end
  end
  # A class Tree for building the tree objects
  # accepts an array on definition
  class Tree < Node
    def initialize(list)
      super(list[0])
      list = list[1..list.length]
      list.each do |val|
        insert(val)
      end
    end
  end
end

tree = AndelaBSTProject::Tree.new([10, 15, 3, 8, 1, 35, 14, 26, 44])

puts tree.to_s

puts "The max value in the tree is: #{tree.get_max}"
puts "The min value in the tree is: #{tree.get_min}"
