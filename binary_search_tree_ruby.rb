# A Binary Search Tree implementation in Ruby
# Introduced funcions to help insert items to the tree and
# print the tree structure.
module AndelaBSTProject
  # The class node to preform actions on a node
  class Node
    attr_accessor :left, :right, :value, :parent

    def initialize(v, parent = nil)
      @value = v
      @left = EmptyNode.new
      @right = EmptyNode.new
      @parent = parent || 'root'
    end

    def insert(*v)
      v.each do |val|
        if @value < val
          push_right(val, @value)
        elsif @value > val
          push_left(val, @value)
        else
          false # the value is already present
        end
      end
    end

    # Returns the value at a node along with its parent
    # and children if they exist.
    def get(v)
      if @value > v
        @left.get(v)
      elsif @value < v
        @right.get(v)
      elsif @value == v
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

    def push_left(v, value)
      @left.insert(v) || self.left = Node.new(v, value)
    end

    def push_right(v, value)
      @right.insert(v) || self.right = Node.new(v, value)
    end
  end
  # A class to initialize the values of an empty node
  class EmptyNode
    def insert(*)
      false
    end

    def to_s
      'nil'
    end
  end
end

tree = AndelaBSTProject::Node.new(10)
tree.insert(15)
tree.insert(3)
tree.insert(8)
tree.insert(35)
tree.insert(14)

puts tree.get(15)
