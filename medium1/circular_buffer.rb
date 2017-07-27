class CircularBuffer
  def initialize(size)
    @size = size
    clear
  end

  def read
    raise BufferEmptyException if @slots.all?(&:nil?)
    element = @slots[@read_index]
    @slots[@read_index] = nil
    update_read_index
    element
  end

  def write(element)
    raise BufferFullException if full?
    return if element.nil?
    @slots[@write_index] = element
    update_write_index
  end

  def write!(element)
    return write(element) unless full?
    return if element.nil?
    @slots[@read_index] = element
    update_read_index
  end

  def clear
    @slots = Array.new(@size)
    @read_index = @size / 2
    @write_index = @read_index
  end

  private

  def full?
    @slots.none?(&:nil?)
  end

  def update_write_index
    @write_index = (@write_index + 1) % @size
  end

  def update_read_index
    @read_index = (@read_index + 1) % @size
  end

  class BufferEmptyException < RuntimeError
  end

  class BufferFullException < RuntimeError
  end
end
