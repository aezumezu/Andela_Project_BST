# A Binary Search Tree implementation in Ruby
# Introduced funcions to help insert items to the tree and
# print the tree structure.
module AndelaBSTProject
  # The class node to preform actions on a node
  class Node
    attr_accessor :left, :right, :value, :parent, :add_c

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

    def depth_fs(num)
      found = false
      my_stack = []
      track = []
      count = 0
      if self.value == num
        found = true
        my_stack.clear
      else
        my_stack.push(self)
        last_add = self.value
        track.push(self.value)
        count += 1
        @add_c = true if @add_C == nil
      end
      while my_stack.empty? == false
        current_node = my_stack.delete_at(0)
        track.delete_at(0)
        if current_node.left.class != EmptyNode && \
          current_node.left.value == num
          found = true #
          break
        elsif current_node.right.class != EmptyNode && \
          current_node.right.value == num
          found = true #
          break
        end
        puts last_add
        puts "Count is #{count}"
        if current_node.left.class != EmptyNode
          my_stack.push(current_node.left)
          track.push(current_node.left.value)
          unless track.include? last_add
            last_add = current_node.left.value
            if add_c == true
              count += 1
              add_c = false
            end
          end
        end
        if current_node.right.class != EmptyNode
          my_stack.push(current_node.right)
          track.push(current_node.right.value)
          unless track.include? last_add
            last_add = current_node.right.value
            if add_c == true
              count += 1
              add_c = false
            end
          end
        end
        puts "Count is #{count}"
        puts last_add
      end
      if found == true
        puts "#{num} is #{count} step(s) deep."
      else
        puts "#{num} is not in the tree."
      end
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

tree = AndelaBSTProject::Node.new(20)
tree.insert(10, 35, 5, 47, 8, 9, 38, 42)

#puts tree.depth_fs(9)

puts tree.get(47)
