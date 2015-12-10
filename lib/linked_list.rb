require '../test/linked_list_test'
require_relative 'node'

class LinkedList
  attr_accessor = :head_node

  def initialize
    @head_node = nil
  end

  def empty?
    @head_node.nil?
  end

  def append(new_tail_node)
    if @head_node.nil?
      @head_node = new_tail_node
    else
      old_tail_node = get_tail_node
      old_tail_node.next_node = new_tail_node
    end
  end

  def get_node_at_position(position)
    current_node = @head_node
    position.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def get_tail_node
    get_node_at_position(count()-1)
  end

  def prepend(new_node)
    old_head_node = @head_node
    @head_node = new_node
    @head_node.next_node = old_head_node                #the node next to the head_node is the old_head_node
  end

  def pop(number_to_delete)
    number_of_nodes = count()
    if number_to_delete >= number_of_nodes
      all()
    elsif
      keep_nodes = number_of_nodes - number_to_delete
      string_node = ""
      cut_left = get_node_at_position(keep_nodes - 1)
      cut_right = cut_left.next_node
      number_to_delete.times do
        string_node += cut_right.data.to_s + " "
        cut_right = cut_right.next_node
      end
      cut_left.next_node = nil
      string_node.strip
    end
  end

  def all
    tail_node = @head_node
    string_node = ""
    while tail_node.next_node != nil
      string_node += tail_node.data.to_s + " "
      tail_node = tail_node.next_node
    end
    string_node += tail_node.data.to_s + " "
    string_node.strip
  end

  def include?(node_to_test)
    tail_node = @head_node
    has_node = false
    while tail_node.next_node != nil
      if tail_node.data == node_to_test
        has_node = true
      end
      tail_node = tail_node.next_node
    end
    has_node
  end

  def find(position, how_many_to_return)
    string_node = ""
    if count() <= position || position < 0
      "node does not exist"
    elsif how_many_to_return <= 0
      "must return more than one node"
    elsif position + how_many_to_return > count()
      "nodes do not exist"
    else
      go_to_node = get_node_at_position(position)
      how_many_to_return.times do
        string_node += go_to_node.data.to_s + " "
        go_to_node = go_to_node.next_node
      end
      string_node.strip
    end
  end

  def count
    tail_node = @head_node
    node_counter = 0
    while tail_node.next_node != nil
      tail_node = tail_node.next_node
      node_counter += 1
    end
    node_counter += 1
  end

  def insert(insert_location, input_node)                       #next_node of new node is cut right, cut_left points to new node
    if insert_location == 0
      prepend(input_node)
      all()
    elsif insert_location > count() || insert_location < 0
      "node does not exist"
    else
      cut_left = get_node_at_position(insert_location-1)        #go to where you want the division to be
      cut_right = cut_left.next_node
      cut_left.next_node = input_node
      input_node.next_node = cut_right
      all()
    end
  end
end
