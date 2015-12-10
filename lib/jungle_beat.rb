require '../test/jungle_beat_test'
require_relative 'linked_list'
require_relative 'node'


class JungleBeat
  attr_accessor :rate, :voice

  def initialize(beat_sequence) #initialize object with desired beats
    @beat_sequence = beat_sequence
    $beat_list = LinkedList.new
    append(beat_sequence)
    reset_rate
    reset_voice
  end

  def reset_rate
    @rate = 20
  end

  def reset_voice
    @voice = "Boing"
  end

  def valid(beat)
    valid_beats = ["tee", "dee", "deep", "bop", "boop", "la", "na",
      "ne", "yo", "da", "di", "do", "day", "ho", "de", "be", "dep", "ba"]
    valid_beats.include?(beat)
  end

  def play
    `say -r #{@rate} -v #{@voice} #{all}`
    count
  end

  def append(beat_sequence)
    beats = beat_sequence.split(" ")
    beat_counter = 0
    beats.each do |beat|
      if valid(beat)
        node = Node.new(beat)
        $beat_list.append(node)
        beat_counter += 1
      end
    end
    beat_counter
  end


  def prepend(beat_sequence)
    beats = beat_sequence.split(" ")
    beat_counter = 0
    beats.each do |beat|
      beat_counter += 1
      node = Node.new(beat)
      $beat_list.prepend(node)
    end
    beat_counter
  end

  def pop(number_to_pop)
    $beat_list.pop(number_to_pop)
  end

  def all
    $beat_list.all
  end

  def count
    $beat_list.count
  end

  def include?(beat_to_find)
    $beat_list.include?(beat_to_find)
  end

  def find(position, how_many_to_return)
    $beat_list.find(position, how_many_to_return)
  end

  def insert(position, beat_sequence)
    beats = beat_sequence.split(" ")
    beats.each do |beat|
      node = Node.new(beat)
      $beat_list.insert(position, node)
    end
    all()
  end
end
