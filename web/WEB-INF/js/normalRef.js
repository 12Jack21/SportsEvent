var scoreTable = null;
var comp_id = null; //报名的比赛 id

$(document).ready(function () {
    // TempScore
    scoreTable = $("#dataTableNormalRef").DataTable({
        "select": false, //开启选择
        "searching": true,
        "responsive": true,
        "ajax": {
            url: "",//TODO
            dataSrc: ""
        },
        "columns": [
            {"data": "athid"},
            {"data": "athlete.name"},
            {"data": "athlete.no"},
            {"data": "score"},
            {"data": "isValid"},
            {"data": null}
        ],
        "columnDefs": [{
            "targets": 0,
            "searchable": false,
            "visible": false
        }, {
            "targets": 5,//操作按钮目标列
            "data": null,
            "render": function (data, type, row) {
                var id = '"' + row.id + '"';
                console.log(data);//用于调试
                var html = "<form  style='width: 300px;'><div class='form-inline'><input class='form-control' style='width: 100px;' " +
                    "type='number' step='0.01' name='score' id='athScore'>" +
                    "<button type='button' class='btn btn-primary' onclick='setScore(" + data.athid + ",this)'>给分</button>";
                html += "<a href='javascript:void(0);' class='up btn btn-default btn-xs'  data-toggle='modal' " +
                    "onclick='showLog(" + data.athid + ")'>" +
                    "<i class='fa fa-edit'></i> 查看记录</a>";
                html += "</div></form>";
                return html;
            }
        }]
    });


});

function setScore(athid,btn){
    var score = $(btn).parent().children("input").val();
    var url = ;
    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        data: {
            data: score
        },
        traditional: true,////这里设置为true,使传递参数变成 data:1
        url: url,
        success: function (result) {
            console.log(result, status);//打印服务端返回的数据(调试用)

            signAlert.children("strong").text("Sign up operation success !!!");
            signAlert.removeClass("alert-danger").addClass("alert-success");
            scoreTable.ajax.reload();//刷新DataTable
            refreshColor();
        },
        error: function () {
            signAlert.children("strong").text("Sign up operation fail !!!");
            signAlert.addClass("alert-danger").removeClass("alert-success");
        },
        complete: function () {
            $("#signModal").modal("hide");
            alertReport(signAlert);
        }
    });

}

function showLog(athid){
    var score = $(btn).parent().children("input").val();
    var url = ;
    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        data: {
            data: score
        },
        traditional: true,////这里设置为true,使传递参数变成 data:1
        url: url,
        success: function (result) {
            console.log(result, status);//打印服务端返回的数据(调试用)

            signAlert.children("strong").text("Sign up operation success !!!");
            signAlert.removeClass("alert-danger").addClass("alert-success");
            scoreTable.ajax.reload();//刷新DataTable
            refreshColor();
        },
        error: function () {
            signAlert.children("strong").text("Sign up operation fail !!!");
            signAlert.addClass("alert-danger").removeClass("alert-success");
        },
        complete: function () {
            $("#signModal").modal("hide");
            alertReport(signAlert);
        }
    });

}

//提交报名
$("#signUpSub").click(function (e) {
    e.preventDefault();
    var select = $("#selectAlert");
    var sLength = athGroupTable.rows(".selected")[0].length;

    if(sLength < 5){
        select.removeClass("alert-danger").removeClass("alert-success").addClass("alert-warning");
        select.children("strong").text("You have selected less than five athletes to sign up !!!");
        alertReport(select);
    }
    else if (sLength == 5){
        var selection = athGroupTable.rows(".selected").data();
        console.log(selection);
        var addAthIds = [];
        for (var i = 0; i < selection.length; i++) {
            addAthIds.push(selection[i].id);
        }
        var signAlert = $("#signAlert");
        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            data: {
                data: addAthIds
            },
            traditional: true,////这里设置为true,使传递参数变成 data:1
            url: "/sports/team/signUp/" + comp_id,
            success: function (result) {
                console.log(result, status);//打印服务端返回的数据(调试用)

                signAlert.children("strong").text("Sign up operation success !!!");
                signAlert.removeClass("alert-danger").addClass("alert-success");
                scoreTable.ajax.reload();//刷新DataTable
                refreshColor();
            },
            error: function () {
                signAlert.children("strong").text("Sign up operation fail !!!");
                signAlert.addClass("alert-danger").removeClass("alert-success");
            },
            complete: function () {
                $("#signModal").modal("hide");
                alertReport(signAlert);
            }
        });
    }
    else {
        select.removeClass("alert-danger").removeClass("alert-success").addClass("alert-warning");
        select.children("strong").text("You have selected more than five athletes to sign up !!!");
        alertReport(select);
    }
    return false;
});

//显示报名表
function sign(compid) {
    var url = "/sports/team/sign/" + compid;
    comp_id = compid;
    if(athGroupTable == null){
        athGroupTable = $('#athDataTableOfSign').DataTable({
            "select": true, //开启选择
            "searching": false,
            "paging":false,
            "responsive": true,
            "ajax": {
                url: url,
                dataSrc: ""
            },
            "columns": [
                {"data": "id"},
                {"data": "name"},
                {"data": "sex"},
                {"data": "age"},
            ],
            "columnDefs": [{
                "targets": 0,
                "searchable": false,
                "visible": false
            },{
                "targets":2,
                "render":function (data, row) {
                    var result = null;
                    if(data.sex == 0)
                        result = "女";
                    else
                        result = "男";
                    return result;
                }
            }]
        });
    }else
        athGroupTable.ajax.url(url).load();

    $("#signModal").modal("show");

}
