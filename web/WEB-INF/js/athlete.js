var athId = null;
$(document).ready(function () {

    //删除运动员
    $(".athDelete").click(function () {
        console.log($(this).parent().children("p").text().trim(),"...");
        athId = parseInt($(this).parent().children("p").text().trim()) ;
        $("#deleteModal").modal("show");
    });

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

function deleteAth() {
    var del = $("#deleteAlert");
    var url = "/sports/team/athlete/delete";
    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        data:{
            data: athId
        },
        traditional:true,////这里设置为true,使传递参数变成 data:1
        url: url,
        success: function (result) {
            console.log(result, status);//打印服务端返回的数据(调试用)
            if (result == true){

                del.children("strong").text("Delete operation success !!!");
                del.removeClass("alert-danger").addClass("alert-success");
                refresh();

            } else {
                del.children("strong").text("Delete coach fail !!!");
                del.addClass("alert-danger").removeClass("alert-success").removeClass("alert-warning");
            }

        },
        error : function() {
            del.children("strong").text("Delete operation fail !!!");
            del.addClass("alert-danger").removeClass("alert-success");
        },
        complete:function () {
            $("#deleteModal").modal("hide");
            alertReport(del);
        }
    });
}


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