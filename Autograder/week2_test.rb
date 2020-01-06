require './Autograder/Interactive'

class Week2Test
    def self.test_q1_1(path)
        Unit.assert_equal(
            [13],
            path,
            'longest_collatz',
            'Longest Collatz Sequenece - Test 1',
            10
        )
    end

    def self.test_q1_2(path)
        Unit.assert_equal(
            [15],
            path,
            'longest_collatz',
            'Longest Collatz Sequenece - Test 2',
            18
        )
    end

    def self.test_q1_3(path)
        Unit.assert_equal(
            [50],
            path,
            'longest_collatz',
            'Longest Collatz Sequenece - Test 3',
            25
        )
    end

    def self.test_q1_4(path)
        Unit.assert_equal(
            [100],
            path,
            'longest_collatz',
            'Longest Collatz Sequenece - Test 4',
            26
        )
    end

    def self.test_q1_5(path)
        Unit.assert_equal(
            [278],
            path,
            'longest_collatz',
            'Longest Collatz Sequenece - Test 5',
            43
        )
    end

    def self.test_q1_6(path)
        Unit.assert_equal(
            [550],
            path,
            'longest_collatz',
            'Longest Collatz Sequenece - Test 6',
            93
        )
    end

    def self.test_q1_7(path)
        Unit.assert_equal(
            [799],
            path,
            'longest_collatz',
            'Longest Collatz Sequenece - Test 7',
            73
        )
    end

    def self.test_q1_8(path)
        Unit.assert_equal(
            [999],
            path,
            'longest_collatz',
            'Longest Collatz Sequenece - Test 8',
            50
        )
    end

    def self.test_q1_9(path)
        Unit.assert_equal(
            [1000],
            path,
            'longest_collatz',
            'Longest Collatz Sequenece - Test 9',
            112
        )
    end

    def self.test_q1_10(path)
        Unit.assert_equal(
            [1543],
            path,
            'longest_collatz',
            'Longest Collatz Sequenece - Test 10',
            110
        )
    end

    def self.test_q1_11(path)
        Unit.assert_equal(
            [5555],
            path,
            'longest_collatz',
            'Longest Collatz Sequenece - Test 11',
            130
        )
    end

    def self.test_q1_12(path)
        Unit.assert_equal(
            [9991],
            path,
            'longest_collatz',
            'Longest Collatz Sequenece - Test 12',
            167
        )
    end
end