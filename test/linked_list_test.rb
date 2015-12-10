gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/linked_list'

class LinkedListTest < Minitest::Test
  def test_is_the_head_of_empty_list_nil
    linked_list = LinkedList.new()
    assert linked_list.empty?
  end

  def test_tail_node_linked_to_nil
    linked_list = LinkedList.new()
    node = Node.new("hi")
    linked_list.append(node)
    assert_nil linked_list.get_tail_node.next_node
  end

  def test_does_it_add_one_node
    linked_list = LinkedList.new()
    node1 = Node.new(4)
    linked_list.append(node1)
    tail_node = linked_list.get_tail_node
    assert_equal 4, tail_node.data
  end

  def test_does_it_return_all_nodes
    linked_list = LinkedList.new()
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.append(node3)
    assert_equal "hi yo sup", linked_list.all
  end

  def test_does_it_prepend_nodes
    linked_list = LinkedList.new()
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    node4 = Node.new("hai")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.append(node3)
    linked_list.prepend(node4)
    assert_equal "hai hi yo sup", linked_list.all
  end

  def test_does_it_count_the_nodes
    linked_list = LinkedList.new
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.append(node3)
    assert_equal 3, linked_list.count
  end

  def test_does_it_pop_off_nodes
    linked_list = LinkedList.new
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.append(node3)
    assert_equal "sup", linked_list.pop(1)
  end

  def test_pop_off_more_nodes_than_available
    linked_list = LinkedList.new
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.append(node3)
    assert_equal "hi yo sup", linked_list.pop(6)
  end

  def test_does_it_return_all_nodes
    linked_list = LinkedList.new
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.prepend(node3)
    assert_equal "sup hi yo", linked_list.all
  end

  def test_does_it_find_nodes
    linked_list = LinkedList.new
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.append(node3)
    assert_equal "hi yo", linked_list.find(0, 2)
  end

  def test_does_it_include_a_node
    linked_list = LinkedList.new
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.append(node3)
    assert linked_list.include?("hi")
    refute linked_list.include?("hai")
  end


  def test_does_it_insert_nodes
    linked_list = LinkedList.new
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    node4 = Node.new("hai")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.append(node3)
    assert_equal "hi yo hai sup", linked_list.insert(2, node4)
  end

  def test_input_validation_for_pop
    linked_list = LinkedList.new
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.append(node3)
    assert_equal "hi yo sup", linked_list.pop(4)
  end

  def test_multiple_methods
    linked_list = LinkedList.new
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    node4 = Node.new("hey")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.prepend(node3)
    linked_list.pop(1)
    linked_list.insert(2, node4)
    assert_equal "sup hi hey", linked_list.all
  end

  def test_if_insert_location_is_zero
    linked_list = LinkedList.new
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    node4 = Node.new("hai")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.append(node3)
    assert_equal "hai hi yo sup", linked_list.insert(0, node4)
  end

  def test_input_validation_for_insert
    linked_list = LinkedList.new
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    node4 = Node.new("hai")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.append(node3)
    assert_equal "node does not exist", linked_list.insert(5, node4)
  end

  def test_input_validation_for_find
    linked_list = LinkedList.new
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.append(node3)
    assert_equal "must return more than one node", linked_list.find(1, 0)
  end

  def test_attempt_to_find_nonexisting_node
    linked_list = LinkedList.new
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.append(node3)
    assert_equal "node does not exist", linked_list.find(6, 1)
  end

  def test_attempt_to_return_nonexisting_nodes
    linked_list = LinkedList.new
    node1 = Node.new("hi")
    node2 = Node.new("yo")
    node3 = Node.new("sup")
    node4 = Node.new("hai")
    linked_list.append(node1)
    linked_list.append(node2)
    linked_list.append(node3)
    linked_list.append(node4)
    assert_equal "nodes do not exist", linked_list.find(3, 2)
  end
end
