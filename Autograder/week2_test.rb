require './Interactive'

class Week2Test < Test::Unit::TestCase

    def self.test_bottles_99(path)
        Interactive.test_match(
           path,
           '',
           './Autograder/week2_test/99_bottles_oup.txt',
           './Autograder/wee2_test/99_bottles_expected.txt',
           1,
           false,
           false,
           Array(1..200),
           "99 Bottles - Test Case 1",
           5
        )
    end

    def self.test_deaf_grandma1(path)
        Interactive.test_match(
            path,
            './Autograder/week2_test/deaf_grandma_inp_quit.txt',
            './Autograder/week2_test/deaf_grandma_oup_quit.txt',
            './Autograder/week2_test/deaf_grandma_expected_quit.txt',
            1,
            true,
            true,
            [1, 2],
            "Deaf Grandma (Regular) - Test Case 1",
            5
        )
    end

    def self.test_deaf_grandma2(path)
        Interactive.test_match(
            path,
            './Autograder/week2_test/deaf_grandma_inp_years.txt',
            './Autograder/week2_test/deaf_grandma_oup_years.txt',
            './Autograder/week2_test/deaf_grandma_expected_years.txt',
            1,
            true,
            true,
            [1, 2],
            "Deaf Grandma (Regular) - Test Case 2",
            5
        )
    end

    def self.test_deaf_grandma3(path)
        Interactive.test_match(
            path,
            './Autograder/week2_test/deaf_grandma_inp_1.txt',
            './Autograder/week2_test/deaf_grandma_oup_1.txt',
            './Autograder/week2_test/deaf_grandma_expected_1.txt',
            3,
            true,
            true,
            Array(2..6),
            "Deaf Grandma (Regular) - Test Case 3",
            5
        )

    end

    def self.test_deaf_grandma4(path)
        Interactive.test_match(
            path,
            './Autograder/week2_test/deaf_grandma_inp_2.txt',
            './Autograder/week2_test/deaf_grandma_oup_2.txt',
            './Autograder/week2_test/deaf_grandma_expected_2.txt',
            3,
            true,
            true,
            Array(2..12),
            "Deaf Grandma (Regular) - Test Case 4",
            5
        )
    end

    def self.test_extended_deaf_grandma1(path)
        Interactive.test_match(
            path,
            './Autograder/week2_test/deaf_grandma_extended_inp_quit.txt',
            './Autograder/week2_test/deaf_grandma_extended_oup_quit.txt',
            './Autograder/week2_test/deaf_grandma_extended_expected_quit.txt',
            1,
            true,
            true,
            [1, 2],
            "Deaf Grandma (Extended) - Test Case 1",
            5
        )
    end

    def self.test_extended_deaf_grandma2(path)
        Interactive.test_match(
            path,
            './Autograder/week2_test/byes_inp.txt',
            './Autograder/week2_test/byes_oup.txt',
            './Autograder/week2_test/byes_expected.txt',
            1,
            true,
            true,
            [2, 3, 4, 6, 7, 8, 11, 12],
            "Deaf Grandma (Extended) - Test Case 2",
            5
        )
    end

    def self.test_extended_deaf_grandma3(path)
        Interactive.test_match(
            path,
            './Autograder/week2_test/integrated_inp_1.txt',
            './Autograder/week2_test/integrated_oup_1.txt',
            './Autograder/week2_test/integrated_expected_1.txt',
            3,
            true,
            true,
            [2, 3, 4, 5, 6, 7, 8, 10, 11, 13, 16, 17, 18, 19],
            "Deaf Grandma (Extended) - Test Case 3",
            5
        )
    end

    def self.test_extended_deaf_grandma4(path)
        Interactive.test_match(
            path,
            './Autograder/week2_test/integrated_inp_2.txt',
            './Autograder/week2_test/integrated_oup_2.txt',
            './Autograder/week2_test/integrated_expected_2.txt',
            3,
            true,
            true,
            [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 18, 19, 21, 22, 23],
            "Deaf Grandma (Extended) - Test Case 4",
            5
        )
    end

    def self.test_leap_year_counter1(path)
        Interactive.test_num_match_only(
            path,
            './Autograder/week2_test/leap_oup_none.txt',
            './Autograder/week2_test/leap_expected_none.txt',
            1,
            false ,
            true,
            './Autograder/week2_test/leap_inp_none.txt',
            "Leap Year Counter - Test Case 1"
        )
    end

    def self.test_leap_year_counter2(path)
        Interactive.test_num_match_only(
            path,
            './Autograder/week2_test/leap_oup_one.txt',
            './Autograder/week2_test/leap_expected_one.txt',
            1,
            false,
            true,
            './Autograder/week2_test/leap_inp_one.txt',
            "Leap Year Counter - Test Case 2"
        )
    end

    def self.test_leap_year_counter3(path)
        Interactive.test_num_match_only(
            path,
            './Autograder/week2_test/leap_oup_many.txt',
            './Autograder/week2_test/leap_expected_many.txt',
            3,
            false ,
            true,
            './Autograder/week2_test/leap_inp_many.txt',
            "Leap Year Counter - Test Case 3"
        )
    end

    def self.test_arr_sort1(path)
        Interactive.test_match(
            path,
            './Autograder/week2_test/standard_arr_inp.txt',
            './Autograder/week2_test/standard_arr_oup.txt',
            './Autograder/week2_test/standard_arr_expected.txt',
            1,
            false,
            true,
            Array(2..11),
            'Array Sort - Test Case 1',
            1
        )
    end

    def self.test_arr_sort2(path)
        Interactive.test_match(
            path,
            './Autograder/week2_test/mixed_arr_inp.txt',
            './Autograder/week2_test/mixed_arr_oup.txt',
            './Autograder/week2_test/mixed_arr_expected.txt',
            1,
            false,
            true,
            Array(2..11),
            'Array Sort - Test Case 2',
            1
        )
    end

    def self.test_arr_sort3(path)
        Interactive.test_match(
            path,
            './Autograder/week2_test/empty_arr_inp.txt',
            './Autograder/week2_test/empty_arr_oup.txt',
            './Autograder/week2_test/empty_arr_expected.txt',
            1,
            false,
            true,
            Array(2..5),
            'Array Sort - Test Case 3',
            1
        )
    end

    def self.test_table_of_contents(path)
        Interactive.test_text_align(
            path,
            './Autograder/week2_test/table_oup.txt',
            './Autograder/week2_test/table_expected.txt',
            10,
            'Table of Contents - Test Case 1',
            1
        )
    end
end