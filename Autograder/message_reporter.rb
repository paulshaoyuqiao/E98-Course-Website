# A helper class written to verbosely report test case status for Engineering 98.

# AUTHOR: Paul Shao

class MessageReporter

  def self.print_exception(exception, explicit)
    puts "[#{explicit ? 'EXPLICIT' : 'INEXPLICIT'}] #{exception.class}: #{exception.message}"
    puts exception.backtrace.join("\n")
  end

  def self.report_preconditions(test_name, time_limit, target, dist, lines, tolerance)
    puts "#{test_name} \n"
    report_front_divider
    unless time_limit <= 0
      puts "[Imposed Time Restraint]: #{time_limit} second(s) \n"
    end
    unless dist <= 0
      puts "[Applying an Edit Distance of]: #{dist} for Comparing Outputs \n"
    end
    if lines.any?
      if lines.length >= 10
        start = lines[0]
        last = lines[lines.length - 1]
        puts "[Lines Considered for Comparing Outputs]: #{start} ~ #{last}"
      else
        puts "[Lines Considered for Comparing Outputs]: #{lines.join(', ')} \n"
      end
    end
    unless tolerance <= 0
      puts "[Applying a Text Alignment Deviation Tolerance of]: #{tolerance} from the aligned center \n"
    end
    unless target.eql?('')
      puts "[Expected Target in Output]: #{target} \n"
    end
    puts "\n"
  end

  def self.report_front_divider
    puts "-------------------------------------------------------------------------------------------------- \n"
  end

  def self.report_end_divider
    puts "-------------------------------------------------------------------------------------------------- \n\n"
  end

  def self.report_stack_divider
    puts "////////////////////////////////////////////////////////////////////////////////////////////////// \n"
  end

  def self.report_passed
    puts "Test Case Passed \n"
    report_end_divider
  end

  def self.report_failed
    puts "Test Case Failed \n"
    report_end_divider
  end

  def self.report_unmatch_exception(expected, actual, line)
    puts "Unmatched Error: \n"
    puts "At line #{line} => Expected: #{expected}, But got #{actual} \n"
    report_failed
  end

  def self.report_timeout_exception
    puts "Timeout Error: \n"
    puts "Method takes too long to run. Please check for unhandled infinite loops. \n"
    report_failed
  end

  def self.report_unfound_exception(target)
    puts "Target Not Found Error: \n"
    puts "Target #{target} not found in user output. \n"
    report_failed
  end

  def self.report_num_unmatched_exception(number, line_index)
    puts "Number Unmatched Error: \n"
    puts "At line #{line_index} => Number(s) #{number} Not Found in Expected Output \n"
    report_failed
  end

  def self.report_unaligned_exception(tolerance, space, line_index)
    puts "Text Unaligned Error: \n"
    puts "At line #{line_index} => Exceeded Misalignment Tolerance of #{tolerance} \n for an Initial Number of #{space} characters \n"
    puts "Check for Unhandled Extraneous Spaces in Your Output \n"
    report_failed
  end

  def self.report_stack_trace_exception(exception, explicit)
    report_stack_divider
    puts "Below is the Stack Trace of the Exception: \n"
    print_exception(exception, explicit)
    report_stack_divider
    report_timeout_exception
  end

end