require './Autograder/Interactive'
require './Autograder/Unit'

class Week1Test

    def self.test_age_in_seconds(path)
        Interactive.test_num_match_only(
            path,
            './Autograder/week1_test/age_in_seconds_oup.txt',
            './Autograder/week1_test/age_in_seconds_expected.txt',
            1,
            false,
            false,
            '',
            'Age in Seconds - Test Case 1',
            0
        )
    end

    def self.test_author_age(path)
        Interactive.test_num_match_only(
            path,
            './Autograder/week1_test/author_age_oup.txt',
            './Autograder/week1_test/author_age_expected.txt',
            1,
            false,
            false,
            '',
            'Author Age - Test Case 1',
            0
        )
    end

    def self.test_hours_in_year(path)
        Interactive.test_num_match_only(
            path,
            './Autograder/week1_test/hours_in_year_oup.txt',
            './Autograder/week1_test/hours_in_year_expected.txt',
            1,
            true,
            false,
            '',
            'Hours in a Year - Test Case 1',
            0
        )
    end

    def self.test_minutes_in_decade(path)
        Interactive.test_num_match_only(
            path,
            './Autograder/week1_test/minutes_in_decade_oup.txt',
            './Autograder/week1_test/minutes_in_decade_expected.txt',
            1,
            true,
            false,
            '',
            'Minutes in Decade - Test Case 1',
            0
        )
    end

    def self.test_bigger_better_favorite_number1(path)
        Interactive.test_num_match_only(
            path,
            './Autograder/week1_test/bigger_better_oup_1.txt',
            './Autograder/week1_test/bigger_better_expected_1.txt',
            1,
            false,
            true,
            './Autograder/week1_test/bigger_better_inp_1.txt',
            'Bigger Better Favorite Number - Test Case 1',
            0
        )
    end

    def self.test_bigger_better_favorite_number2(path)
        Interactive.test_num_match_only(
            path,
            './Autograder/week1_test/bigger_better_oup_2.txt',
            './Autograder/week1_test/bigger_better_expected_2.txt',
            1,
            false,
            true,
            './Autograder/week1_test/bigger_better_inp_2.txt',
            'Bigger Better Favorite Number - Test Case 2',
            0
        )
    end

    def self.test_greeting1(path)
        Interactive.test_inp_reformatted_match(
            path,
            './Autograder/week1_test/greeting_inp_1.txt',
            './Autograder/week1_test/greeting_oup_1.txt',
            1,
            'Greeting - Test Case 1'
        )
    end

    def self.test_greeting2(path)
        Interactive.test_inp_reformatted_match(
            path,
            './Autograder/week1_test/greeting_inp_2.txt',
            './Autograder/week1_test/greeting_oup_2.txt',
            1,
            'Greeting - Test Case 2'
        )
    end

    def self.test_angry_boss1(path)
        Interactive.test_inp_reformatted_match(
            path,
            './Autograder/week1_test/angry_boss_inp_1.txt',
            './Autograder/week1_test/angry_boss_oup_1.txt',
            1,
            'Angry Boss - Test Case 1'
        )
    end

    def self.test_angry_boss2(path)
        Interactive.test_inp_reformatted_match(
            path,
            './Autograder/week1_test/angry_boss_inp_2.txt',
            './Autograder/week1_test/angry_boss_oup_2.txt',
            1,
            'Angry Boss - Test Case 2'
        )
    end

    def self.test_table_of_contents(path)
        Interactive.test_text_align(
            path,
            './Autograder/week1_test/table_oup.txt',
            './Autograder/week1_test/table_expected.txt',
            4,
            'Table of Contents - Test Case 1',
            1
        )
    end

end

