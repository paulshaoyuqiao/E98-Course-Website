# A helper class written for unit testing programs for Engineering 98.

# AUTHOR: Paul Shao

class Unit

  def self.print_exception(exception, explicit)
    puts "[#{explicit ? 'EXPLICIT' : 'INEXPLICIT'}] #{exception.class}: #{exception.message}"
    puts exception.backtrace.join("\n")
  end

  def self.assert_equal(inp_list, script_path, method_name, test_name, expected)
    load script_path
    puts "#{test_name} \n"
    puts "-------------------------------------------------------------------------------------------------- \n"
    puts "Input: #{inp_list}, Expected: #{expected}"
    begin
      result = send(method_name, *inp_list)
      puts "Actual: #{result}"
      if result == expected
        puts "Test Case Passed \n"
      else
        puts "Test Case Failed \n"
      end
      puts "-------------------------------------------------------------------------------------------------- \n\n"
      return
    rescue NoMethodError => e
      print_exception(e, true)
    rescue => e
      print_exception(e, false)
    end
    puts "Test Case Failed \n"
    puts "-------------------------------------------------------------------------------------------------- \n\n"
  end
end

