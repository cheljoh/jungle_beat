gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/node'

class NodeTest < Minitest::Test
  def test_does_node_have_data
    node = Node.new("hi")
    assert_equal "hi", node.data
  end

  def test_does_node_have_next_node
    node = Node.new("hi")
    assert_nil node.next_node
  end
end
