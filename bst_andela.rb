# A Binary Search Tree implementation in Ruby
# Introduced funcions to help insert items to the tree and
# print the tree structure.
module AndelaBSTProject
  # The class node to preform actions on a node
  class Node
    attr_accessor :left, :right, :value, :parent

    def initialize(val = nil, parent = nil)
      @value = val
      @left = EmptyNode.new
      @right = EmptyNode.new
      @parent = parent || 'root'
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
      left_node = left.to_s
      right_node = right.to_s
      puts "{#{left_node} => #{value} <= #{right_node} => #{parent}}"
    end

    def to_s
      getnodes
    end

    def push_left(key, value)
      @left.insert(key) || self.left = Node.new(key, value)
    end

    def push_right(key, value)
      @right.insert(key) || self.right = Node.new(key, value)
    end
  end
  # A class to initialize the values of an empty node
  class EmptyNode
    def get(*)
      false
    end

    def insert(*)
      false
    end

    def to_s
      'nil'
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

tree = AndelaBSTProject::Tree.new([10, 15, 3, 8, 35, 14, 26])

puts tree.to_s