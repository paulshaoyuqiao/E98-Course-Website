# A helper class written to test interactive programs for Engineering 98.

# AUTHOR: Paul Shao

require 'timeout'

class Interactive
    # The primary method for testing interactive programs for the scope of this course.
    # @param test_file -> the .rb file containing the program to test on
    # @param inp -> the .txt file with the given input from the instructor's end
    # @param oup -> the .txt file with the output that whatever is printed to the console
    # will be redirected to
    # @param expected_oup -> the .txt file with the expected output
    # @param time_limit -> (in seconds) the time constraint to place on the program when
    # it is being run. Should be used primarily to check for infinite loop or unhandled exceptions.
    # @param gr_modified -> true IFF it is for testing the deaf grandma or its extension program.
    # The method has an additional clause for handling random integers generated in this range.
    # @return true IFF all lines of output produced by the given program exactly match all of those
    # from the expected output.

    @@NUM_PATTERN = /\d+\.?\d+/

    def self.print_exception(exception, explicit)
        puts "[#{explicit ? 'EXPLICIT' : 'INEXPLICIT'}] #{exception.class}: #{exception.message}"
        puts exception.backtrace.join("\n")
    end

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

    def self.report_unmatch_exception(expected, actual, line)
        puts "Unmatched Error: \n"
        puts "At line #{line} => Expected: #{expected}, But got #{actual} \n"
        puts "Test Case Failed \n"
        puts "------------------------------------------------------------- \n\n"
    end

    def self.report_timeout_exception
        puts "Timeout Error: \n"
        puts "Method takes too long to run. Please check for unhandled infinite loops. \n"
        puts "Test Case Failed \n"
        puts "------------------------------------------------------------- \n\n"
    end

    def self.report_unfound_exception(target)
        puts "Target Not Found Error: \n"
        puts "Target #{target} not found in user output. \n"
        puts "Test Case Failed \n"
        puts "------------------------------------------------------------- \n\n"
    end

    def self.report_passed
        puts "Test Case Passed \n"
        puts "------------------------------------------------------------- \n\n"
    end

    def self.add_import_statement(add_to, test_file)
        original_lines = File.read(add_to).split(/\n/)
        original_lines.insert(0, "load #{test_file}")
        File.open(add_to, "w") {|f| f.write(original_lines.join("\n"))}
    end

    def self.test_num_match_only(test_file, oup, expected_oup, time_limit, multiple_ans, required_input, inp)
        if required_input
            cmd = "ruby #{test_file} < #{inp} > #{oup}"
        else
            cmd = "ruby #{test_file} > #{oup}"
        end
        begin
            Timeout::timeout(time_limit) do
                system(cmd)
            end
            actual = File.readlines(oup).each
            expected = File.readlines(expected_oup).each
            i = 0
            while i < actual.size
                i += 1
                curr_actual = actual.next.strip
                curr_expected = expected.next.strip
                actual_number = curr_actual.scan(@@NUM_PATTERN).map {|x| x.to_f }
                expected_number = curr_expected.scan(@@NUM_PATTERN).map {|y| y.to_f }
                unless actual_number.any?
                    next
                end
                if multiple_ans
                    num = actual_number[0]
                    unless expected_number.include?(num)
                        return false
                    end
                else
                    unless (expected_number & actual_number).any?
                        return false
                    end
                end
            end
        rescue Timeout::Error
            puts "Error: your method is taking too long to run."
            return false
        end
        return true
    end

    def self.test_partial_str_match(test_file, inp, target, time_limit, test_name, test_method, params)
        puts "#{test_name} \n"
        puts "------------------------------------------------------------- \n"
        puts "[Imposed Time Restraint]: #{time_limit} second(s) \n"
        puts "[Expected Target in Output]: #{target} \n\n"
        enumerate_content("Input", inp)
        begin
            file = File.open(inp)
            puts "\n Actual Output: \n"
            load test_file
            $stdin = file
            result = Timeout::timeout(time_limit) do
                send(test_method, *params)
            end
            file.close
            puts "\n"
            unless result.to_s.include?(target)
                report_unfound_exception(target)
                return
            end
        rescue Timeout::Error
            report_timeout_exception
            return
        end
        report_passed
    end

    def self.test_complete_partial_match(test_file, inp, oup, expected, time_limit, require_input)
        if require_input
            cmd = "ruby #{test_file} < #{inp} > #{oup}"
        else
            cmd = "ruby #{test_file} > #{oup}"
        end
        begin
            Timeout::timeout(time_limit) do
                system(cmd)
            end
            compare = File.readlines(expected).each
            actual = File.readlines(oup).each
            i = 0
            contains_oup = false
            while i < compare.size
                i += 1
                compareTo = compare.next.strip
                target = actual.next.strip
                if actual.eql?("")
                    break
                end
                if target.include?(compareTo)
                    contains_oup = true
                end
            end
            unless contains_oup

            end
            rescue Timeout::Error
            return false
        end
        return true
    end

    def self.test_text_align(test_file, oup, expected_oup)
        cmd = "ruby #{test_file} > #{oup}"
        system(cmd)
        actual = File.readlines(oup).each
        expected = File.readlines(expected_oup).each
        adjustment = actual.next.size
        i = 1
        while i < actual.size - 9
            i += 1
        end
        until i >= actual.size
            i += 1
            curr_actual = actual.next.strip
            if curr_actual.size - (adjustment - 2) > 10
                return false
            end
            shrinked = curr_actual.gsub(/\s+/, "").downcase
            curr_expected = expected.next.strip
            unless shrinked.eql?(curr_expected)
                return false
            end
        end
        return true
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

    def self.test_match(test_file, inp, oup, expected_oup, time_limit, gr_modified, required_input, lines, test_name, dist)
        puts "#{test_name} \n"
        puts "------------------------------------------------------------- \n"
        puts "[Imposed Time Restraint]: #{time_limit} second(s) \n"
        puts "[Applying an Edit Distance of]: #{dist} for Comparing Outputs \n"
        if required_input
            enumerate_content("[Input]", inp)
            cmd = "ruby #{test_file} < #{inp} > #{oup}"
        else
            cmd = "ruby #{test_file} > #{oup}"
        end
        enumerate_content("[Expected]", expected_oup)
        begin
            status = Timeout::timeout(time_limit) do
                system(cmd)
            end
            actual = File.readlines(oup).each
            expected = File.readlines(expected_oup).each
            i = 0
            while i < actual.size
                i += 1
                if lines.include?(i)
                    curr_actual = actual.next.strip
                    curr_expected = expected.next.strip
                    while curr_expected.eql?("")
                        curr_expected = expected.next.strip
                    end
                    while curr_actual.eql?("")
                        curr_actual = actual.next.strip
                        i += 1
                    end
                    if curr_expected.match?(@@NUM_PATTERN)
                        unless assert_num_equal(curr_actual, curr_expected, 0.01)
                            report_unmatch_exception(curr_expected, curr_actual, i)
                            return
                        end
                    else
                        ces = curr_expected.gsub(/\s+/, "").downcase
                        cas = curr_actual.gsub(/\s+/, "").downcase
                        unless edit_distance(ces, cas) <= dist
                            report_unmatch_exception(curr_expected, curr_actual, i)
                            return
                        end
                    end
                    if gr_modified
                        if curr_actual[0..1].eql?("NO")
                            unless grandma_test(curr_actual, curr_expected)
                                report_unmatch_exception(curr_expected, curr_actual, i)
                                return
                            end
                        end
                    end
                end
            end
        rescue Timeout::Error
            report_timeout_exception
            return
        end
        report_passed
    end

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

end
