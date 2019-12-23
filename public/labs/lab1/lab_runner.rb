require "rubygems"
require "open-uri"
require "json"

def save_and_exit
	if $progress_file && $progress
		File.open($progress_file, "w") { |pf| pf.write($progress.to_s + "\n") }
		puts " We'll save your progress for next time!"
	end
	exit
end

def expect(answer, correct_msg='OK!')
	answer = answer.downcase
	input = flush_and_get.downcase
	while answer != input
		puts 'Not quite. Please try again.'
		input = flush_and_get.downcase
	end
	puts correct_msg
end

def expect_exact(answer, correct_msg='OK!')
	input = flush_and_get
	while answer != input
		puts 'Not quite. Please try again.'
		input = flush_and_get
	end
	puts correct_msg
end

def flush_and_get
	$stdout.flush
	input = $stdin.gets.lstrip.rstrip
	input.nil? || input.chomp! == 'exit' ? save_and_exit() : input
end

valid_lab_start = 1
valid_lab_end = 1

if ARGV.length != 1
	puts 'You must provide a single argument for the number of the lab you want to run.'
	exit
elsif ARGV[0].to_i < valid_lab_start || ARGV[0].to_i > valid_lab_end
	puts "That's not a valid lab number, please input a number between " +
	     "#{valid_lab_start} and #{valid_lab_end}."
	exit
end

puts()
puts "For each of the following questions, type in what would be
displayed by the console if you ran a program containing the
question\'s code, along with the final return value."
puts()
puts "Type Error if you think there is an error."
puts()
puts "For multiple choice, type the answer you think is correct."
puts()
puts "If the answer has multiple lines, separate each output with
a SEMICOLON followed by a single space"
puts()
puts "When calling a function, do so like this:
	`function_name(arg1, arg2, ...)`"
puts()
puts "If you get stuck, try out in the interpreter."
puts()
puts "Type OK to continue."
expect('ok', '')
puts()

encoded_url = URI.encode(File.read("lab" + ARGV[0] + ".txt").chomp)
url = URI.parse(encoded_url)
open(url) do |f|
	$progress_file = ".lab" + ARGV[0] + "_progress.txt"
	$progress = File.exist?($progress_file) ? File.read($progress_file).chomp.to_i : 0
	offset = chapter_index = 0

	trap("INT") do
		save_and_exit
	end

	JSON.parse(f.read).each do |chapter|
		puts '***** ' + chapter['chapter'].upcase + ' *****'
		puts ''
		offset += chapter_index
		chapter_index = 0

		chapter['questions'].each do |question|
			chapter_index += 1
			puts '----------Question ' + chapter_index.to_s + '-----------'
			question['question'].each { |line| puts line }
			if (chapter_index + offset) <= $progress
				puts question['answer']
			else
				question["exact"] ? expect_exact(question['answer']) : expect(question['answer'])
				$progress += 1
			end
			puts ''
		end
		puts ''
	end

	File.open($progress_file, "w") { |pf| pf.write($progress.to_s + "\n") }
	puts "Congratulations for completing the lab!"
end
