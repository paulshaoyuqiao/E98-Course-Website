$(function() {
    // By default, display week 1's required files
    $("#week1").show();
    $("#week").on("change", function(){
        var week = $(this).val();
        if (week === "week1") {
            showOne(1);
        } else if (week === "week2") {
            showOne(2);
        } else if (week === "week3") {
            showOne(3);
        } else if (week === "week4") {
            showOne(4);
        }
    });
});

function showOne(week) {
    if (week === 1) {
        $("#week1").fadeIn();
        $("#week2").fadeOut();
        $("#week3").fadeOut();
        $("#week4").fadeOut();
    } else if (week === 2) {
        $("#week2").fadeIn();
        $("#week3").fadeOut();
        $("#week4").fadeOut();
        $("#week1").fadeOut();
    } else if (week === 3) {
        $("#week3").fadeIn();
        $("#week1").fadeOut();
        $("#week2").fadeOut();
        $("#week4").fadeOut();
    } else if (week === 4) {
        $("#week4").fadeIn();
        $("#week1").fadeOut();
        $("#week2").fadeOut();
        $("#week3").fadeOut();
    }
}