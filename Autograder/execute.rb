# Helper class created to run all the given tests per method.
# @return (in the form of stdout)  per line: the name of the test,
# the number of passed tests, and the number of failed tests.

#AUTHOR: Paul Shao

class Exec
  @@test_method = {
      "week3" => {
        "ask.rb" => ['ask1', 'ask2'],
        "old_roman_numerals.rb"=>['old_roman0', 'old_roman1', 'old_roman2', 'old_roman3', 'old_roman4'], "new_roman_numerals.rb"=>['new_roman0', 'new_roman1', 'new_roman2', 'new_roman3', 'new_roman4', 'new_roman5'] }
    }
  @@week_class = {'week1' =>"Week1Test", 'week2' =>"Week2Test", 'week3' =>"Week3Test"}

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
