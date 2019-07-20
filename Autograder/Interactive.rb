# A helper class written to test interactive programs for Engineering 98.

# AUTHOR: Paul Shao

require 'timeout'
require './Autograder/message_reporter'
require './Autograder/content_enumerator'
require './Autograder/utils'

class Interactive
    # All methods used for testing different scripts contain >=1 of the following inputs
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
    # @param test_name -> the name of this test
    # @param multiple_ans -> if the test contains multiple acceptable answers
    # @param required_input -> if this test requires a specific user input
    # @param target -> the target to match in the user output
    # @param lines -> an array of line indices to check the outputs for
    # @param dist -> an upper threshold used for matching strings using edit distance
    # @param tolerance -> an upper threshold used for checking text alignment

    @@NUM_PATTERN = /\d+\.?\d+/

    def self.test_num_match_only(test_file, oup, expected_oup, time_limit, multiple_ans, required_input, inp, test_name, padding)
        MessageReporter.report_preconditions(test_name, time_limit, '', -1, [], -1)
        if required_input
            ContentEnumerator.enumerate_content("Input", inp)
            cmd = "ruby #{test_file} < #{inp} > #{oup}"
        else
            cmd = "ruby #{test_file} > #{oup}"
        end
        ContentEnumerator.enumerate_numbers("Numbers Expected to be Matched", expected_oup)
        begin
            status = Timeout::timeout(time_limit) do
                system(cmd)
            end
            actual = File.readlines(oup).each
            expected = File.readlines(expected_oup).each
            i = 0
            count = 0
            while count < padding
                actual.next
                count += 1
                i += 1
            end
            while i < actual.size
                i += 1
                curr_actual = actual.next.strip
                curr_expected = expected.next.strip
                actual_number = curr_actual.scan(@@NUM_PATTERN).map(&:to_i)
                expected_number = curr_expected.scan(@@NUM_PATTERN).map(&:to_i)
                if actual_number.any?
                    if multiple_ans
                        num = actual_number[0]
                        unless expected_number.include?(num)
                            MessageReporter.report_num_unmatched_exception(num, i)
                            return
                        end
                    else
                        unless (expected_number & actual_number).any?
                            MessageReporter.report_unmatch_exception(expected_number, actual_number, i)
                            return
                        end
                    end
                end
            end
        rescue Timeout::Error
            MessageReporter.report_timeout_exception
            return
        rescue => e
            MessageReporter.report_stack_trace_exception(e, true)
            return
        end
        MessageReporter.report_passed
    end

    def self.test_partial_str_match(test_file, inp, target, time_limit, test_name, test_method, params)
        MessageReporter.report_preconditions(test_name, time_limit, target, -1, [], -1)
        ContentEnumerator.enumerate_content("Input", inp)
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
                MessageReporter.report_unfound_exception(target)
                return
            end
        rescue Timeout::Error
            MessageReporter.report_timeout_exception
            return
        rescue => e
            MessageReporter.report_stack_trace_exception(e, true)
            return
        end
        MessageReporter.report_passed
    end

    def self.test_inp_reformatted_match(test_file, inp, oup, time_limit, test_name)
        MessageReporter.report_preconditions(test_name, time_limit, '', -1, [], -1)
        compressed_target = Utils.concatenate_in_one_line(inp).strip.downcase()
        puts "[Searching for Compressed Target in Output]: #{compressed_target} \n\n"
        cmd = "ruby #{test_file} < #{inp} > #{oup}"
        begin
            status = Timeout::timeout(time_limit) do
                system(cmd)
            end
            actual = File.readlines(oup).each
            i = 0
            while i < compare.size
                i += 1
                curr_actual = actual.next.strip.downcase()
                if curr_actual.include?(compressed_target)
                    MessageReporter.report_passed
                    return
                end
            end
        rescue Timeout::Error
            MessageReporter.report_timeout_exception
            return
        rescue => e
            MessageReporter.report_stack_trace_exception(e, true)
            return
        end
        MessageReporter.report_unfound_exception(compressed_target)
    end

    def self.test_text_align(test_file, oup, expected_oup, tolerance, test_name, time_limit)
        MessageReporter.report_preconditions(test_name, time_limit, '', -1, [], tolerance)
        cmd = "ruby #{test_file} > #{oup}"
        begin
            status = Timeout::timeout(time_limit) do
                system(cmd)
            end
            actual = File.readlines(oup).each
            expected = File.readlines(expected_oup).each
            adjustment = actual.next.size
            i = 1
            while i < actual.size - 9
                i += 1
            end
            while i < actual.size
                i += 1
                curr_actual = actual.next.strip
                unless curr_actual.size - (adjustment - 2) <= tolerance
                    MessageReporter.report_unaligned_exception(tolerance, adjustment, i)
                    return
                end
                shrunk = curr_actual.gsub(/\s+/, "").downcase
                curr_expected = expected.next.strip
                unless shrunk.eql?(curr_expected)
                    MessageReporter.report_unmatch_exception(curr_expected, curr_actual, i)
                    return
                end
            end
        rescue Timeout::Error
            MessageReporter.report_timeout_exception
            return
        rescue => e
            MessageReporter.report_stack_trace_exception(e, true)
            return
        end
        MessageReporter.report_passed
    end

    def self.test_match(test_file, inp, oup, expected_oup, time_limit, gr_modified, required_input, lines, test_name, dist)
        MessageReporter.report_preconditions(test_name, time_limit, '', dist, lines, -1)
        if required_input
            ContentEnumerator.enumerate_content("[Input]", inp)
            cmd = "ruby #{test_file} < #{inp} > #{oup}"
        else
            cmd = "ruby #{test_file} > #{oup}"
        end
        ContentEnumerator.enumerate_content("[Expected]", expected_oup)
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
                        unless Utils.assert_num_equal(curr_actual, curr_expected, 0.01)
                            MessageReporter.report_unmatch_exception(curr_expected, curr_actual, i)
                            return
                        end
                    else
                        ces = curr_expected.gsub(/\s+/, "").downcase
                        cas = curr_actual.gsub(/\s+/, "").downcase
                        unless Utils.edit_distance(ces, cas) <= dist
                            MessageReporter.report_unmatch_exception(curr_expected, curr_actual, i)
                            return
                        end
                    end
                    if gr_modified
                        if curr_actual[0..1].eql?("NO")
                            unless Utils.grandma_test(curr_actual, curr_expected)
                                MessageReporter.report_unmatch_exception(curr_expected, curr_actual, i)
                                return
                            end
                        end
                    end
                end
            end
        rescue Timeout::Error
            MessageReporter.report_timeout_exception
            return
        rescue => e
            MessageReporter.report_stack_trace_exception(e, true)
            return
        end
        MessageReporter.report_passed
    end

end
