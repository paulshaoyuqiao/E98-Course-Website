# A helper class written with various helper methods to assist in the execution of Interactive Class.

# AUTHOR: Paul Shao

class Utils
  # Helper method written to check if two string of numbers are equal to each other (or
  # the absolute value of their difference is less than or equal to the given threshold).
  def self.assert_num_equal(first_num_str, second_num_str, threshold)
    first_num = first_num_str.to_f
    second_num = second_num_str.to_f
    return (first_num - second_num).abs <= threshold
  end

  # Helper method written to check specifically for the deaf_grandma.rb test case.
  # Checks if the first half of the string matches what we expect and the output random year
  # is within the given range.
  def self.grandma_test(curr_actual, curr_expected)
    curr_actual_first_half = curr_actual[0..13].gsub(/\s+/, "").downcase
    curr_expected_first_half = curr_expected[0..13].gsub(/\s+/, "").downcase
    unless edit_distance(curr_actual_first_half, curr_expected_first_half) <= 3
      return false
    end
    curr_actual_year = curr_actual[14..17].to_i
    unless in_range(curr_actual_year, 1930, 1950)
      return false
    end
    return true
  end

  # Helper method written to check if 2 strings are equal.
  def self.assert_equal(s1, s2)
    unless s1.eql?(s2)
      puts "Error: Unmatched output. Expecting #{s1}, but got #{s2}."
    end
  end

  # Helper method written to check if a given number is in the range [low, high].
  def self.in_range(number, low, high)
    return number >= low && number <= high
  end

  def self.edit_distance(first, second)
    first_len = first.length
    second_len = second.length
    return first_len if second_len == 0 or second.nil?
    return second_len if first_len == 0 or first.nil?
    dp = Array.new(first_len + 1) {Array.new(second_len + 1)}
    (0..first_len).each {|i| dp[i][0] = i}
    (0..second_len).each {|j| dp[0][j] = j}
    (1..second_len).each do |j|
      (1..first_len).each do |i|
        dp[i][j] = if first[i - 1] == second[j - 1]
                     dp[i - 1][j - 1]
                   else
                     [dp[i - 1][j] + 1, dp[i][j - 1] + 1, dp[i - 1][j - 1] + 1].min
                   end
      end
    end
    dp[first_len][second_len]
  end

  def self.concatenate_in_one_line(file)
    one_line = ''
    begin
      IO.readlines(file).each do |line|
        one_line += line.strip + " "
      end
    rescue EOFError => e
      print_exception(e, true)
    rescue => e
      print_exception(e, false)
    end
    return one_line
  end


  def self.add_import_statement(add_to, test_file)
    original_lines = File.read(add_to).split(/\n/)
    original_lines.insert(0, "load #{test_file}")
    File.open(add_to, "w") {|f| f.write(original_lines.join("\n"))}
  end

end