require 'set'

class AutograderController < ApplicationController
    @@files_by_week = {
        "week1" => ["age_in_seconds.rb", "author_age.rb", "hours_in_year.rb", "minutes_in_decade.rb","bigger_better_favorite_number.rb", "full_name_greeting.rb", "angry_boss.rb", "table_of_contents.rb"],
        "week2" =>["q1.rb", "q2.rb", "q3.rb", "q4.rb"],
        "week3" => ["ask.rb", "old_roman_numerals.rb", "new_roman_numerals.rb"],
        "week4" => ["array_max.rb", "contains_char.rb", "count_array.rb", "factorial.rb", "sum_of_digits.rb"]
    }
    @@total_tests_by_week = {"week1" => 11, "week2" => 16, "week3" => 13, "week4" => 20}
    @@lab_codes_by_week = {
        "week1" => "tomhiddleston",
        "week2" => "beyonce",
        "week3" => "johnnydepp",
        "week4" => "scarlettjohansson"
    }

    def import_lab
      begin
        week = params["labweek"]
        week_number = week[-1].to_i
        user_email = current_user.email
        user_name = current_user.name
        if params[:labfile].nil? or params[:labfile].length == 0
          flash[:notice] = "Warning: Please Make Sure the Lab Submission File is Uploaded."
          redirect_to :controller => 'course', :action => 'score'
        else
          filepath = params[:labfile][0].path
          secret_codeword = @@lab_codes_by_week[week]
          value = `python "./Autograder/lab_check.py" #{filepath} #{secret_codeword}`
          result = value.split("\n")[0]
          curr_record = Score.where(email: user_email, name: user_name, week: week_number, assignment: "lab")
          if result == 'True'
            if curr_record.any?
              curr_record[0].total_test = 1
              curr_record[0].passed_test = 1
              curr_record[0].total_score = 100
              curr_record[0].save
            else
              Score.create(
                  :email => user_email,
                  :name => user_name,
                  :week => week_number,
                  :assignment => "lab",
                  :total_test => 1,
                  :passed_test => 1,
                  :total_score => 100
              )
            end
            redirect_to :controller => 'course', :action => 'score'
          else
            flash[:notice] = "It seems like you haven't finished the lab for this week. \n
                              Please make sure to finish it before uploading anything."
            redirect_to :controller => 'course', :action => 'score'
          end
        end
      rescue NoMethodError => e
        flash[:notice] = "Unexpected Error: Please Make Sure the Lab Submission File is Uploaded."
        redirect_to :controller => 'course', :action => 'score'
      end
    end

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
          if @unrecognized_files.length != @@files_by_week[week].length
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
            curr_record = Score.where(email: user_email, name: user_name, week: week_number, assignment: "homework")
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
                  :assignment => "homework",
                  :total_test => @total_test_cases,
                  :passed_test => @passed_test_cases,
                  :total_score => overall_score
              )
            end
          else
            flash[:notice] = "Warning: Please Submit At Least One File For #{week} to the Autograder."
            redirect_to :controller => 'course', :action => 'score'
          end
        rescue NoMethodError => e
          flash[:notice] = "Warning: Please Make Sure You Upload At Least One File Before Proceeding."
          redirect_to :controller => 'course', :action => 'score'
        end
    end

    def self.generate_score(total, passed)
      if total == 0 and passed == 0
        return 0
      end
      return (passed / (total + 0.0) * 100).round(2)
    end

end
