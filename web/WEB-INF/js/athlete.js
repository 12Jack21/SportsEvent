
$(document).ready(function () {

    $(".athDelete").click(function () {

    })
});

//进行相关操作后用警告框通知前端
function alertReport($alert) {
    $alert.removeAttr("hidden").show();
    //设置为 5 秒后自动关闭警告框
    return setTimeout(function () {
        $alert.hide();
    },5000);
}

$("#addAthlete").submit(function (event) {
    event.preventDefault();
    var $form = $(this);
    var add = $("#addAlert");

    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: $form.attr("action"),
        data: $form.serialize(),
        success: function (result) {
            console.log(result, status);//打印服务端返回的数据(调试用)
            console.log(result);

            add.children("strong").text("Add athlete success !!!");
            add.removeClass("alert-danger").addClass("alert-success");
            
            //刷新对应的卡片Section
            refresh();
            
            $form[0].reset();
        },
        error : function() {
            add.children("strong").text("Add athlete fail !!!");
            add.removeClass("alert-danger").addClass("alert-success");
        },
        complete:function () {
            $("#addModal").modal("hide");
            alertReport(add);
        }
    });

    return false;
});

//刷新对应的卡片Section
function refresh() {
    var postfix = null;
    var age = $("#ageInput").val();
    if(age >= 7 && age <= 8)
        postfix = 0;
    else if(age >= 9 && age <=10)
        postfix = 1;
    else
        postfix = 2;


    $.ajax({
        type: "POST",//方法类型
        dataType: "html",//预期服务器返回的数据类型
        url: "/sports/team/athlete/list/" + postfix,
        // data: $form.serialize(),
        success: function (result) {
            console.log(result);

            if(postfix == 0)
                $("#section0").html(result);
            else if (postfix == 1)
                $("#section1").html(result);
            else
                $("#section2").html(result);

        },
        error : function() {
            console.log("Refresh fail !!!");
        }

    });

}