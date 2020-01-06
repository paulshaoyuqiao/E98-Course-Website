
function checkfiles() {
    clearCheckMarks();
    addCheckMarks();
};


let files_per_week =  {
    "week1": ["age_in_seconds.rb", "author_age.rb", "hours_in_year.rb", "minutes_in_decade.rb","bigger_better_favorite_number.rb", "full_name_greeting.rb", "angry_boss.rb", "table_of_contents.rb"],
    "week2":["q1.rb"],
    "week3": ["ask.rb", "old_roman_numerals.rb", "new_roman_numerals.rb"],
    "week4": ["array_max.rb", "contains_char.rb", "count_array.rb", "factorial.rb", "sum_of_digits.rb"]
};

let all_weeks = ["week1", "week2", "week3", "week4"];

function addCheckMarks() {
    console.log("adding checkmarks");
    let files = document.querySelector(".FileUpload").files;
    let week = document.querySelector(".WeekSelect").value;

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
            var file_i_tag;
            if (actual_files[j] === '99_bob') {
                file_i_tag = document.querySelector("#bob_99");
            }
            else {
                file_i_tag = document.querySelector("#" + actual_files[j]);
            }
            file_i_tag.textContent += " ✔";
        }
    }
}

function clearCheckMarks() {
    console.log("clearing checkmarks");
    for (var w = 0; w < all_weeks.length; w++) {
        let curr_week = all_weeks[w];
        let curr_files = files_per_week[curr_week];
        let actual_files = curr_files.map(function (el) {
            return el.substring(0, el.length - 3);
        });
        console.log(actual_files);
        for (var k = 0; k < actual_files.length; k++) {
            var file_i_tag;
            if (actual_files[k] === '99_bob') {
                file_i_tag = document.querySelector("#bob_99");
            }
            else {
                file_i_tag = document.querySelector("#" + actual_files[k]);
            }
            if (file_i_tag.textContent.includes("✔")) {
                let f_len = file_i_tag.textContent.length;
                file_i_tag.textContent = file_i_tag.textContent.substring(0, f_len - 2);
            }
        }
    }
}
