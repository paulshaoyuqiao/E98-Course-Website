# frozen_string_literal: true

# The base Node Class
class Node
  protected

  attr_writer :prev, :next

  public

  attr_reader :data, :prev, :next

  # Initialize a Linked List object with the given data
  # @param data - The data to be entered into this Linked List
  # @return nil - Modifies the object in-place.
  def initialize(data)
    @data = data
  end

  # Remove the current Linked Node
  def remove
    @prev.next = @next if @prev
    @next.prev = @prev if @next
    @next = @prev = nil
  end

  # Append a node after the current one
  def insert_after(node)
    remove
    @next = node.next
    @next.prev = self if @next
    @prev = node
    node.next = self
  end
end
