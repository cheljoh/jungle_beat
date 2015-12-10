gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/jungle_beat'

class JungleBeatTest < Minitest::Test
  def test_does_it_append_nodes
    jungle_beat = JungleBeat.new("da da")
    assert_equal 2, jungle_beat.append("do da")
    assert_equal "da da do da", jungle_beat.all
  end

  def test_does_it_prepend_nodes
    jungle_beat = JungleBeat.new("be ba")
    assert_equal 2, jungle_beat.prepend("do do")
    assert_equal "do do be ba", jungle_beat.all
  end

  def test_does_it_pop_off_nodes
    jungle_beat = JungleBeat.new ("do da de da")
    assert_equal "de da", jungle_beat.pop(2)
    assert_equal "do da", jungle_beat.all
  end

  def test_does_it_show_all_nodes
    jungle_beat = JungleBeat.new("da da")
    jungle_beat.append("de da")
    jungle_beat.append("yo da")
    assert_equal "da da de da yo da", jungle_beat.all
  end

  def test_does_it_count_all_nodes
    jungle_beat = JungleBeat.new("da da")
    jungle_beat.append("de da")
    jungle_beat.append("yo da")
    assert_equal 6, jungle_beat.count
  end

  def test_does_it_include_a_node
    jungle_beat = JungleBeat.new("da da")
    jungle_beat.append("de da")
    jungle_beat.append("yo da")
    assert jungle_beat.include?("yo")
    refute jungle_beat.include?("day")
  end

  def test_does_it_find_nodes
    jungle_beat = JungleBeat.new("da da do da di")
    assert_equal "da da do", jungle_beat.find(0, 3)
  end

  def test_does_it_insert_nodes
    jungle_beat = JungleBeat.new("da de da")
    assert_equal "yo yo yo da de da", jungle_beat.insert(0, "yo yo yo")
  end

  def test_multiple_methods
    jungle_beat = JungleBeat.new("da da")
    jungle_beat.prepend("ho ho")
    jungle_beat.append("ne ne")
    jungle_beat.insert(3, "yo da yo")
    jungle_beat.pop(2)
    assert_equal "ho ho da yo da yo da", jungle_beat.all
  end

  def test_does_it_make_sweet_beats_and_returns_number
    jungle_beat = JungleBeat.new("da da")
    jungle_beat.prepend("ho ho")
    jungle_beat.append("ne ne")
    jungle_beat.insert(3, "yo da yo")
    jungle_beat.pop(2)
    assert_equal 7, jungle_beat.play
  end

  def test_valid_input
    jungle_beat = JungleBeat.new("ho ho ho di do")
    assert_equal "ho ho ho di do", jungle_beat.all()
  end

  def test_invalid_input
    jungle_beat = JungleBeat.new("hello world dee day")
    assert_equal "dee day", jungle_beat.all()
  end

  def test_rate_reset
    jungle_beat = JungleBeat.new("ba ba ba")
    jungle_beat.play
    jungle_beat.rate = 200
    jungle_beat.play
    jungle_beat.reset_rate
    assert_equal 20, jungle_beat.rate
  end

  def test_voice_reset
    jungle_beat = JungleBeat.new("ba ba ba")
    jungle_beat.play
    jungle_beat.voice = "Alice"
    jungle_beat.play
    jungle_beat.reset_voice
    assert_equal "Boing", jungle_beat.voice
  end
end
