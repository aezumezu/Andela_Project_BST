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
        return "Node does not exit"
      end
    end

    def getnodes
      left.to_s
      right.to_s
      "(#{left_child} => (#{value}) <= #{right_child}) => #{parent}"
    end

    def to_s
      # Prints the nodes in the format
      # (left_child => (node_value) <= right_child) => parent_value
      puts getnodes
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
        return "The lowest key in the tree is \'#{value}\'"
      end
    end

    def get_max
      if right.get_max != false
        return right.get_max
      else
        return "The highest key in the tree is \'#{value}\'"
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

def display_menu
  puts
  puts "------------ Binary Search Tree Menu ------------"
  puts "B - To Search for a node using Breadth first Search."
  puts "D - To Search for a node using Depth first Search."
  puts "G - To print a particular node."
  puts "H - Get the highest(max) key in the tree."
  puts "I - To Insert a number in the tree."
  puts "L - Get the Lowest(min) key in the tree."
  puts "P - Display the Tree"
  puts "Q - To quit."
  puts "-------------------------------------------------"
  puts
end

puts "WELCOME TO THE BINARY SEARCH TREE"
puts "TO GET STARTED, ENTER A NUMBER AND PRESS ENTER"
puts "TO STOP ADDING NUMBERS, ENTER TWO ZEROS e.g 00"
input = gets.chomp
my_array = []
my_array.push(Integer(input)) if input != "00"
while input != "00" || my_array.empty?
  input = gets.chomp
  my_array.push(Integer(input)) if input != "00"
end
tree = AndelaBSTProject::Tree.new(my_array)
puts "Weldone! The tree has been created."
input = ""
while true
  reply = ""
  display_menu()
  input = gets.chomp.downcase
  case input
  when input = "b"
    puts "Coming soon."
  when input = "d"
    puts "Coming Soon."
  when input = "g"
    puts "Enter node to start from."
    reply = gets.chomp
    if tree.get(reply.to_i) == false
      puts "No such key found in tree"
    else
      puts tree.get(reply.to_i)
    end
  when input = "h"
    puts tree.get_max
  when input = "i"
    puts "Enter a number to insert."
    reply = Integer(gets.chomp)
    tree.insert(reply)
  when input = "l"
    puts tree.get_min
  when input = "p"
    puts tree.to_s
  when input = "q"
    puts "Thank you for using the Binary Search Tree."
    break
  else
    puts "Unknown request"
  end
end

