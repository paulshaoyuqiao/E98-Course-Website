require './Autograder/Interactive'
require './Autograder/execute'
require './Autograder/Unit'

class Week4Test
  def self.test_arr_max1(path)
    Unit.assert_equal(
        [[1]],
        path,
        'array_max',
        'Array Max - Test 1',
        1
    )
  end

  def self.test_arr_max2(path)
    Unit.assert_equal(
        [[9, 5, 4, 12, 10, 8]],
        path,
        'array_max',
        'Array Max - Test 2',
        12
    )
  end

  def self.test_arr_max3(path)
    Unit.assert_equal(
        [Array(1..100)],
        path,
        'array_max',
        'Array Max - Test 3',
        100
    )
  end

  def self.test_arr_max4(path)
    Unit.assert_equal(
        [[10, 10, 10, 10, 10, 10]],
        path,
        'array_max',
        'Array Max - Test 4',
        10
    )
  end

  def self.test_contains_char1(path)
    Unit.assert_equal(
        ['', 'a'],
        path,
        'contains_char',
        'Contains Char - Test 1',
        false
    )
  end

  def self.test_contains_char2(path)
    Unit.assert_equal(
        ['omnivore', 'v'],
        path,
        'contains_char',
        'Contains Char - Test 2',
        true
    )
  end

  def self.test_contains_char3(path)
    Unit.assert_equal(
        ['rmijclwspcgo', 'g'],
        path,
        'contains_char',
        'Contains Char - Test 3',
        true
    )
  end

  def self.test_contains_char4(path)
    Unit.assert_equal(
        ['mitochondria', ' '],
        path,
        'contains_char',
        'Contains Char - Test 4',
        false
    )
  end

  def self.test_count_array1(path)
    Unit.assert_equal(
        [[1, 2, 3, 4]],
        path,
        'count_array',
        'Count Array - Test 1',
        4
    )
  end

  def self.test_count_array2(path)
    Unit.assert_equal(
        [[1, [2], [3, [4]]]],
        path,
        'count_array',
        'Count Array - Test 2',
        4
    )
  end

  def self.test_count_array3(path)
    Unit.assert_equal(
        [[[[[[[1, 2, 3, 4]]]]]]],
        path,
        'count_array',
        'Count Array - Test 3',
        4
    )
  end

  def self.test_count_array4(path)
    Unit.assert_equal(
        [[1, [[[[2]], [[[3], [[4]]]]]]]],
        path,
        'count_array',
        'Count Array - Test 4',
        4
    )
  end

  def self.test_factorial1(path)
    Unit.assert_equal(
        [0],
        path,
        'factorial',
        'Factorial - Test 1',
        1
    )
  end

  def self.test_factorial2(path)
    Unit.assert_equal(
        [4],
        path,
        'factorial',
        'Factorial - Test 2',
        24
    )
  end

  def self.test_factorial3(path)
    Unit.assert_equal(
        [6],
        path,
        'factorial',
        'Factorial - Test 3',
        720
    )
  end

  def self.test_factorial4(path)
    Unit.assert_equal(
        [10],
        path,
        'factorial',
        'Factorial - Test 4',
        3628800
    )
  end

  def self.test_sum_of_digits1(path)
    Unit.assert_equal(
        [8],
        path,
        'sum_of_digits',
        'Sum of Digits - Test 1',
        8
    )
  end

  def self.test_sum_of_digits2(path)
    Unit.assert_equal(
        [10201001],
        path,
        'sum_of_digits',
        'Sum of Digits - Test 2',
        5
    )
  end

  def self.test_sum_of_digits3(path)
    Unit.assert_equal(
        [123456789],
        path,
        'sum_of_digits',
        'Sum of Digits - Test 3',
        45
    )
  end

  def self.test_sum_of_digits4(path)
    Unit.assert_equal(
        [547019203001],
        path,
        'sum_of_digits',
        'Sum of Digits - Test 4',
        32
    )
  end

end