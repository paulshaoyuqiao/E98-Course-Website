# frozen_string_literal: true

# Implementation of the Linked List Class, Inherits from Node
class LinkedList < Node
  protected :remove

  def initialize
    @next = @prev = self
  end

  def head
    @next unless @next == self
  end

  def tail
    @prev unless @prev == self
  end

  def add_first(node)
    node.insert_after(self)
  end

  def add_last(node)
    node.insert_after(prev)
  end

  def each
    return enum_for(:each) unless block_given?

    node = @next
    while node != self
      yield node
      node = node.next
    end
  end

  def to_array
    each.collect(&:data)
  end
end
