# Helper class created to run all the given tests per method.
# @return (in the form of stdout)  per line: the name of the test,
# the number of passed tests, and the number of failed tests, along with debubgging/logging statements

#AUTHOR: Paul Shao

class Exec
  @@test_method = {
      "week4" => {
          "array_max.rb" => %w(arr_max1 arr_max2 arr_max3 arr_max4),
          "contains_char.rb" => %w(contains_char1 contains_char2 contains_char3 contains_char4),
          "count_array.rb" => %w(count_array1 count_array2 count_array3 count_array4),
          "factorial.rb" => %w(factorial1 factorial2 factorial3 factorial4),
          "sum_of_digits.rb" => %w(sum_of_digits1 sum_of_digits2 sum_of_digits3 sum_of_digits4)
      },
      "week3" => {
          "ask.rb" => %w(ask1 ask2),
          "old_roman_numerals.rb"=> %w(old_roman0 old_roman1 old_roman2 old_roman3 old_roman4),
          "new_roman_numerals.rb"=> %w(new_roman0 new_roman1 new_roman2 new_roman3 new_roman4 new_roman5)
      },
      "week2" => {
          "q1.rb" => %w(q1_1 q1_2 q1_3 q1_4 q1_5 q1_6 q1_7 q1_8 q1_9 q1_10 q1_11 q1_12)
      },
      "week1" => {
          "age_in_seconds.rb" => ["age_in_seconds"],
          "author_age.rb" => ["author_age"],
          "hours_in_year.rb" => ["hours_in_year"],
          "minutes_in_decade.rb" => ["minutes_in_decade"],
          "bigger_better_favorite_number.rb" => %w(bigger_better_favorite_number1 bigger_better_favorite_number2),
          "full_name_greeting.rb" => %w(greeting1 greeting2),
          "angry_boss.rb" => %w(angry_boss1 angry_boss2),
          "table_of_contents.rb" => ["table_of_contents"]
      }
    }
  @@week_class = {"week1" =>"Week1Test", "week2" =>"Week2Test", "week3" =>"Week3Test", "week4" => "Week4Test"}

  def self.run_all_test(file_path, week_name, file_name)
    methods_by_week = @@test_method[week_name]
    test_class_name = @@week_class[week_name]
    tests_per_method = methods_by_week[file_name]
    tests_per_method.each do |method|
      test_output = `ruby -r "./Autograder/#{week_name}_test.rb" -e "#{test_class_name}.test_#{method} '#{file_path}'"`
      puts test_output
    end
  end
end
