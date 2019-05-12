
$(document).ready(function () {
    var ini = $("#iniTab");
    var fi = $("#finTab");
    var initial = $("#initial");
    var final = $("#final");
    console.log(ini);
    console.log(initial);
    ini.addClass("text-gray-700").addClass("borderAround");
    fi.addClass("borderBottom");
    ini.tab('show');


    ini.click(function (e) {
        console.log("ini click");
        e.preventDefault();
        $(this).tab('show');
        $(this).removeClass("borderBottom").addClass("borderAround");
        fi.removeClass("borderAround").removeClass("active").addClass("borderBottom").removeClass("text-gray-700").addClass("text-primary");
        ini.removeClass("text-primary").addClass("text-gray-700");
    });

    fi.click(function (e) {
        console.log("fi click");
        e.preventDefault();
        $(this).tab('show');
        $(this).removeClass("borderBottom").addClass("borderAround");
        ini.removeClass("borderAround").removeClass("active").removeClass("text-gray-700").addClass("text-primary").addClass("borderBottom");
        fi.removeClass("text-primary").addClass("text-gray-700");
    });


});

// //TODO 用类来改hover
// ini.mouseover(function (e) {
//     e.preventDefault();
//     $(this).css("background-color", "#e3e6f0");
// });
// ini.mouseout(function (e) {
//     e.preventDefault();
//     $(this).css("background-color", "white");
// });
// fi.mouseover(function (e) {
//     e.preventDefault();
//     $(this).css("background-color", "#e3e6f0");
// });
// fi.mouseout(function (e) {
//     e.preventDefault();
//     $(this).css("background-color", "white");
// });


