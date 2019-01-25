$(function() {
    $("#week").on("change", function(){
        var week = $(this).val();
        if (week === "week1") {
            $("#week1").show();
        } else if (week === "week2") {
            $("#week2").show();
        } else if (week === "week3") {
            $("#week3").show();
        } else {
            $("#week4").show();
        }
    });
})