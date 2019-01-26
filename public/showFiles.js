$(function() {
    // By default, display week 1's required files
    showOne(1);
    $("#week").on("change", function(){
        var week = $(this).val();
        if (week === "week1") {
            showOne(1);
            document.querySelector("#week4").style.visibility = "none;";
        } else if (week === "week2") {
            showOne(2);
            document.querySelector("#week4").style.visibility = "none;";
        } else if (week === "week3") {
            showOne(3);
            document.querySelector("#week4").style.visibility = "none;";
        } else if (week === "week4") {
            showOne(4);
        }
    });
});

function showOne(week) {
    var allWeeks = [1, 2, 3, 4];
    var hideWeeks = allWeeks.map(function (el) {
        return el !== week;
    });
    for (var i = 0; i < hideWeeks.length; i++) {
        $("#week" + i.toString()).hide();
        console.log("week " + i);
    }
    $("#week" + week.toString()).show();
}