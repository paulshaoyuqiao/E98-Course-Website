# A helper class written to verbosely enumerate file content for logging/debugging purposes for Engineering 98.

# AUTHOR: Paul Shao

class ContentEnumerator

  @@NUM_PATTERN = /\d+\.?\d+/

  def self.enumerate_content(title, file)
    puts "#{title}: \n"
    begin
      IO.readlines(file).each(&method(:puts))
    rescue EOFError => e
      print_exception(e, true)
    rescue => e
      print_exception(e, false)
    end
  end

  def self.enumerate_numbers(title, file)
    puts "#{title}: \n"
    line_index = 0
    begin
      IO.readlines(file).each do |line|
        candidate = line.scan(@@NUM_PATTERN).map(&:to_i)
        line_index += 1
        if candidate.any?
          puts "[Expecting Numbers (At Least 1 Match) at Line #{line_index}]: #{candidate.join(', ')} \n"
        end
      end
    rescue EOFError => e
      print_exception(e, true)
    rescue => e
      print_exception(e, false)
    end
  end

end