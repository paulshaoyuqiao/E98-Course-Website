document.querySelector(".FileUpload").addEventListener("change", function () {
    addCheckMarks();
});

function addCheckMarks() {
    console.log("detected");
    let files = document.querySelector(".FileUpload").files;
    let week = document.querySelector(".WeekSelect").value;
    let files_per_week =  {
        "week1": ["age_in_seconds.rb", "author_age.rb", "hours_in_year.rb", "minutes_in_decade.rb","bigger_better_favorite_number.rb", "full_name_greeting.rb", "angry_boss.rb", "table_of_contents.rb"],
        "week2":["99_bob.rb", "deaf_grandma.rb", "deaf_grandma_extended.rb", "leap_year_counter.rb", "array_sort.rb", "table_of_contents.rb"],
        "week3": ["ask.rb", "old_roman_numerals.rb", "new_roman_numerals.rb"],
        "week4": ["array_max.rb", "contains_char.rb", "count_array.rb", "factorial.rb", "sum_of_digits.rb"]
    };
    let expected_files = files_per_week[week];
    if (files !== undefined) {
        let uploaded = [];
        for (var i = 0; i < files.length; i++) {
            uploaded.push(files[i].name);
        }
        let actual_files = expected_files.filter(value => -1 !== uploaded.indexOf(value));
        actual_files = actual_files.map(function (el) {
            return el.substring(0, el.length - 3);
        });
        console.log(actual_files);
        for (var j = 0; j < actual_files.length; j++) {
            let file_i_tag = document.querySelector("#" + actual_files[j]);
            file_i_tag.append(" ✅");
        }
    }
}
