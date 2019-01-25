require 'set'

class AutograderController < ApplicationController
    @@files_by_week = {
        "week1" => ["age_in_seconds.rb", "author_age.rb", "hours_in_year.rb", "minutes_in_decade.rb","bigger_better_favorite_number.rb", "full_name_greeting.rb", "angry_boss.rb", "table_of_contents.rb"],
        "week2" =>["99_bob.rb", "deaf_grandma.rb", "deaf_grandma_extended.rb", "leap_year_counter.rb", "array_sort.rb", "table_of_contents.rb"],
        "week3" => ["ask.rb", "old_roman_numerals.rb", "new_roman_numerals.rb"],
        "week4" => ["array_max.rb", "contains_char.rb", "count_array.rb", "factorial.rb", "sum_of_digits.rb"]
    }
    @@total_tests_by_week = {"week1" => 11, "week2" => 16, "week3" => 13, "week4" => 20}
    def import
        begin
          filenames = params[:files].map{|f| f.original_filename}
          filepaths = params[:files].map{|f| f.path}
          week = params["week"]
          user_email = current_user.email
          user_name = current_user.name
          week_number = week[-1].to_i
          @unrecognized_files = @@files_by_week[week].select{ |f| !filenames.include?(f) }
          @result_array_disp = []
          i = 0
          @passed_test_cases = 0
          while i < filenames.length
            filename = filenames[i]
            filepath = filepaths[i]
            value = `ruby -r "./Autograder/execute.rb" -e "Exec.run_all_test '#{filepath}', '#{week}', '#{filename}'"`
            result = value.split("\n")
            @result_array_disp += result
            @passed_test_cases += value.scan(/(?=Test Case Passed)/).count
            i += 1
          end
          @compiled_results = []
          current_test = []
          @result_array_disp.each do |element|
            if element.include?("- Test Case")
              current_test.append(element)
            elsif element.include?("Test Case Passed")
              current_test.append("Passed")
            elsif element.include?("Test Case Failed")
              current_test.append("Failed")
            end
          end
          index = 0
          while index < current_test.length
            @compiled_results.append([current_test[index], current_test[index + 1]])
            index += 2
          end
          @total_test_cases = @@total_tests_by_week[week]
          @week_name = week
          overall_score = AutograderController.generate_score(@total_test_cases, @passed_test_cases)
          curr_record = Score.where(email: user_email, name: user_name, week: week_number)
          if curr_record.any?
            curr_record[0].total_test = @total_test_cases
            curr_record[0].passed_test = @passed_test_cases
            curr_record[0].total_score = overall_score
            curr_record[0].save
          else
            Score.create(
                :email => user_email,
                :name => user_name,
                :week => week_number,
                :total_test => @total_test_cases,
                :passed_test => @passed_test_cases,
                :total_score => overall_score
            )
          end
        rescue NoMethodError => e
          flash[:notice] = "Warning: Please Make Sure You Upload At Least One File Before Proceeding."
          redirect_to root_url
        end
    end

    def self.generate_score(total, passed)
      if total == 0 and passed == 0
        return 0
      end
      return (passed / (total + 0.0) * 100).round(2)
    end

end
