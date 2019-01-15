# E98-autograder

#### **Author** : Paul Shao
______________________________________________________________________________________________________________________________
<span style="color:red"> To begin using, please read **Usages** and **Primary Procedures** first. </span>
______________________________________________________________________________________________________________________________
## Most Recent Update on Jan 9th, 2019 - 9:25PM EST - Rev J
* **IMPORTANT**: Please refer to the Newest Changes section for a change in the grading scheme provided by the autograder (updated since last week)!
* Updated with tests for assignments from **week3**; updated **parameters** for `chapters` and `files`, see **Newest Changes**.

Newest Changes:
* The autograder has been **redesigned** in terms of the following in grading schemes:
  * Instead of seeking a full match, a range of *tolerable* **Edit Distance Score** will be given for full credits to allow for nuances.
  * The total score for one particular method will be now provided on a **floating point number scale** to ensure accurate reflection of the students' performance on each individual subtest.
* For this week, to save some time on running the autograder, please copy and paste the values below for the parameters `chapters` and `files`:
  * `chapters = ['ch09']`
  * `files = ['ask.rb', 'new_roman_numerals.rb', 'old_roman_numerals.rb']`
* IMPORTANT: Now when calling the main method `fetch_from_github`, an additional parameter is specified: `repo_names`. This parameter serves to specify the name of the repository the student is using for the assignment (in particular if the student is not using the default repo name). Please see the **updated Primary Procedures** for more guidelines.

### Usages:
The E98-autograder compiles the primary scripts required to automate testing of students' Ruby assignments.
The autograder can be used in the following 2 ways:
1. Streamline testing students' codes against expected outputs and generate final scores through `automate.py`.
2. Unit testing individual methods (should only be used for debugging or validating purposes).
______________________________________________________________________________________________________________________________
**To all course staff**: Please run the tests to generate the scores **directly through `automate.py`**. Feel free to consult me **first** if you are confused about the process or want to test individual methods.
______________________________________________________________________________________________________________________________
### Primary Procedures (Please use the autograder this way 😃):
The streamlined version of the autograder is run through the CLI directly. Follow the steps below to generate scores for your students for this week's assignments:
1. `git clone` this repository. (If cloned already, `git pull` to check for test-cases updates).
2. `cd` into this repository and enter the command `python -i automate.py`.
3. Now that we are interacting with the Python main execution file, we will be relying on the method `fetch_from_github`.
4. `fetch_from_github` takes in 4 parameters: `usernames`, `week`, `chapters`, `files`:
   1. `usernames` is a list of the Github usernames for your students.
   2. `week` is a string indicating the current week of the assignment (e.x. `week1`).
   3. `repo_names` is a list of the Github repostiory names corresponding to the student **at the same list index**. 
   4. `chapters` is a list of the chapters this assignment contains (e.x. `['ch02', 'ch05']`).
   5. `files` is a list of the files the autograder will test (e.x. `['age_in_seconds.rb', 'hours_in_year.rb']`).
5. Determine the values of all 4 parameters, assign them to variables, and execute the `fetch_from_github` with the paramters, you should see statements such as `fetch success!` during the entire process.
6. In the end, a `csv` file containing all the students' scores will be generated in the main directory of this Python script:
   1. The `csv` file contains 4 columns: `Github username`, `Week`, `Tested Method`, and `Score`.
   2. `Score` is generated on a scale of 2 per method (it is computed by normalizing the total number of passed test cases).

______________________________________________________________________________________________________________________________
### Alternative Usages (for unit testing/debugging purposes ONLY)
#### Again, please discuss with me before using the autograder this way.

To allow for unit testing of specific methods locally, you should create a ruby unit test classes consisting of unit testing and integrated testing for interactive methods, it will invoke both the **static unit test and interactive test instances** on different methods.
______________________________________________________________________________________________________________________________
### Current Testing Parameters/Functionalities Supported:

* Interactive or Static (One-time) Input
* Time Limit
* Specific by-line Error Feedback

______________________________________________________________________________________________________________________________

### Further Explanations:

**Unit Test for Static (One-time Input and Output) Methods**

Primary Testing Method: `assert_equal`

**Integrated Test**

Primary Testing Method: `Interactive.test_match` + `assert`

### How it works for Interactive Test
It takes in usually around 3~4 files,
1. `students_program.rb`
2. `test_input.txt` (could be optional depending on whether or not **input** is required)
3. `test_output.txt`
4. `expected_output.txt`

Then, with a **given time constraint**, the interactive class will run the program with the test input in the textfile, redirect the output stream to the empty textfile, and in the end, compare that against the expected output line by line.
