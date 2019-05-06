var ini = $("#iniTab");
var fi = $("#finTab");
var initial = $("#initial");
var final = $("#final");
$(document).ready(function () {
    ini.addClass("text-gray-700");
    ini.addClass("borderAround");
    fi.addClass("borderBottom");
    ini.tab('show');

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

ini.click(function (e) {
    console.log("ini click");
    e.preventDefault();
    $(this).tab('show');
    $(this).removeClass("borderBottom");
    fi.removeClass("borderAround");
    fi.removeClass("active");
    $(this).addClass("borderAround");
    fi.addClass("borderBottom");

    ini.removeClass("text-primary");
    ini.addClass("text-gray-700");
    fi.removeClass("text-gray-700");
    fi.addClass("text-primary");
});
fi.click(function (e) {
    console.log("fi click");
    e.preventDefault();
    $(this).tab('show');
    $(this).removeClass("borderBottom");
    ini.removeClass("borderAround");
    ini.removeClass("active");
    $(this).addClass("borderAround");
    ini.addClass("borderBottom");

    fi.removeClass("text-primary");
    fi.addClass("text-gray-700");
    ini.removeClass("text-gray-700");
    ini.addClass("text-primary");
});
