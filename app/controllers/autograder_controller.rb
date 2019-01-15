require 'set'

class AutograderController < ApplicationController
    @@files_by_week = {"week1" => ["age_in_seconds.rb", "author_age.rb", "hours_in_year.rb", "minutes_in_decade.rb","bigger_better_favorite_number.rb", "full_name_greeting.rb", "angry_boss.rb", "table_of_contents.rb"],"week2" =>["99_bob.rb", "deaf_grandma.rb", "deaf_grandma_extended.rb", "leap_year_counter.rb", "array_sort.rb", "table_of_contents.rb"], "week3" => ["ask.rb", "old_roman_numerals.rb", "new_roman_numerals.rb"]}
    def import
        filenames = params[:files].map{|f| f.original_filename}
        filepaths = params[:files].map{|f| f.path}
        week = params[:week]
        @unrecognized_files = @@files_by_week[week].select{ |f| !filenames.include?(f) }
        @result_array_disp = []
        i = 0
        @passed_test_cases = 0
        @total_test_cases = 0
        while i < filenames.length
          filename = filenames[i]
          filepath = filepaths[i]
          value = `ruby -r "./Autograder/execute.rb" -e "Exec.run_all_test '#{filepath}', '#{week}', '#{filename}'"`
          result = value.split("\n")
          @result_array_disp += result
          @passed_test_cases += value.scan(/(?=Test Case Passed)/).count
          @total_test_cases += value.scan(/(?=Test Case)/).count / 2
          i += 1
        end
        @week_name = week
    end

end
