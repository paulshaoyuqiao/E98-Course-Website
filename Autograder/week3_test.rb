require './Autograder/Interactive'
require './Autograder/execute'
require './Autograder/Unit'

class Week3Test
    def self.test_ask1(path)
        Interactive.test_partial_str_match(
           path,
           './Autograder/week3_test/ask_1_in.txt',
           'false',
           1,
           "Ask - Test Case 1",
           'ask',
           ['Do you like Computer Science?']
        )
    end

    def self.test_ask2(path)
        Interactive.test_partial_str_match(
            path,
            './Autograder/week3_test/ask_2_in.txt',
            'true',
            1,
            "Ask - Test Case 2",
            "ask",
            ["Do you like Computer Science?"]
        )
    end

    def self.test_old_roman0(path)
        Unit.assert_equal(
          [0],
          path,
          "romanize_old",
          "Old Roman Numerals - Test Case 1",
          nil
        )
    end

    def self.test_old_roman1(path)
        Unit.assert_equal(
          [7],
          path,
          "romanize_old",
          "Old Roman Numerals - Test Case 2",
          "VII"
        )
    end

    def self.test_old_roman2(path)
        Unit.assert_equal(
          [69],
          path,
          "romanize_old",
          "Old Roman Numerals - Test Case 3",
          "LXVIIII"
        )
    end

    def self.test_old_roman3(path)
        Unit.assert_equal(
          [473],
          path,
          "romanize_old",
          "Old Roman Numerals - Test Case 4",
          "CCCCLXXIII"
        )
    end

    def self.test_old_roman4(path)
        Unit.assert_equal(
          [2019],
          path,
          "romanize_old",
          "Old Roman Numerals - Test Case 5",
          "MMXVIIII"
        )
    end

    def self.test_new_roman0(path)
        Unit.assert_equal(
          [0],
          path,
          "romanize_new",
          "New Roman Numerals - Test Case 1",
          nil
      )
    end

    def self.test_new_roman1(path)
        Unit.assert_equal(
          [7],
          path,
          "romanize_new",
          "New Roman Numerals - Test Case 2",
          "VII"
        )
    end

    def self.test_new_roman2(path)
        Unit.assert_equal(
            [69],
            path,
            'romanize_new',
            'New Roman Numerals - Test Case 3',
            "LXIX"
        )
    end

    def self.test_new_roman3(path)
        Unit.assert_equal(
                [473],
                path,
                'romanize_new',
                'New Roman Numerals - Test Case 4',
                'CDLXXIII'
        )
    end

    def self.test_new_roman4(path)
        Unit.assert_equal(
                [2019],
                path,
                'romanize_new',
                'New Roman Numerals - Test Case 5',
                'MMXIX'
        )
    end

    def self.test_new_roman5(path)
        Unit.assert_equal(
                [1000000],
                path,
                'romanize_new',
                'New Roman Numerals - Test Case 6',
                nil
        )
    end

end
