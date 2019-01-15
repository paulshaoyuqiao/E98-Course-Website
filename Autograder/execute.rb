# Helper class created to run all the given tests per method.
# @return (in the form of stdout)  per line: the name of the test,
# the number of passed tests, and the number of failed tests, along with debubgging/logging statements

#AUTHOR: Paul Shao

class Exec
  @@test_method = {
      "week3" => {
          "ask.rb" => %w(ask1 ask2),
          "old_roman_numerals.rb"=> %w(old_roman0 old_roman1 old_roman2 old_roman3 old_roman4),
          "new_roman_numerals.rb"=> %w(new_roman0 new_roman1 new_roman2 new_roman3 new_roman4 new_roman5)
      },
      "week2" => {
          "99_bob.rb" => [:bottles_99],
          "deaf_grandma.rb" => %w(deaf_grandma1 deaf_grandma2 deaf_grandma3 deaf_grandma4),
          "deaf_grandma_extended.rb" => %w(extended_deaf_grandma1 extended_deaf_grandma2 extended_deaf_grandma3 extended_deaf_grandma4),
          "leap_year_counter.rb" => %w(leap_year_counter1 leap_year_counter2 leap_year_counter3),
          "array_sort.rb" => %w(arr_sort1 arr_sort2 arr_sort3),
          "table_of_contents.rb" => [:table_of_contents]
      },
      "week1" => {
          "age_in_seconds.rb" => [:age_in_seconds],
          "author_age.rb" => [:author_age],
          "hours_in_year.rb" => [:hours_in_year],
          "minutes_in_decade.rb" => [:minutes_in_decade],
          "bigger_better_favorite_number.rb" => [:bigger_better_favorite_number],
          "full_name_greeting.rb" => %w(greeting1 greeting2 greeting3),
          "angry_boss.rb" => %w(angry_boss1 angry_boss2),
          "table_of_contents.rb" => [:table_of_contents]
      }
    }
  @@week_class = {"week1" =>"Week1Test", "week2" =>"Week2Test", "week3" =>"Week3Test"}

  def self.run_all_test(file_path, week_name, file_name)
    methods_by_week = @@test_method[week_name]
    test_class_name = @@week_class[week_name]
    tests_per_method = methods_by_week[file_name]
    tests_per_method.each do |method|
      test_output = `ruby -r "./Autograder/#{week_name}_test.rb" -e "#{test_class_name}.#{'test_' + method} '#{file_path}'"`
      puts test_output
    end
  end
end
