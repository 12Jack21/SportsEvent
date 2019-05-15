var table = null;
var logTable = null;
var compid = null; //比赛 id
var athid = null;

$(document).ready(function () {
    athid = parseInt($("#athid").val().trim());
    compid = parseInt($("#compid").text().trim());

    var url = "/sports/referee/majorConfirm/refList";
    table = $("#dataTableMajorConfirm").DataTable({
        "select": false, //开启选择
        "searching": true,
        "responsive": true,
        "traditional":true,
        "ajax": {
            url: url,//TODO
            data:{
                compid: compid,
                athid: athid
            },
            dataSrc: ""
        },
        "columns": [
            {"data": "tempScore_id"},
            {"data": "referee.id"},
            {"data": "referee.name"},
            {"data": "score"},
            {"data": "isValid"},
            {"data": null}
        ],
        "columnDefs": [{
            "targets": 0,
            "searchable": false,
            "visible": false
        }, {
            "targets": 4,
            "render":function (data) {
                console.log(data);
                if(data == null)
                    return "未审核";
                var isValid = parseInt(data);
                if(isValid == 1)
                    return "接受";
                else
                    return "拒绝";
            }
        },{
            "targets": 5,//操作按钮目标列
            "data": null,
            //data 为null时，可以取到整个的对象数据，不为null时，只能取到当前给定的单元格的值
            "render": function (data, type, row) {
                var id = '"' + row.id + '"';
                var html = "<a href='javascript:void(0);' class='up btn btn-default btn-xs text-success' " +
                    "onclick='accept(" + data.tempScore_id + "," + data.isValid + ")'>" +
                    "<i class='fa fa-edit'></i> Accept</a>";
                html += "<a href='javascript:void(0);' class='up btn btn-default btn-xs text-danger'" +
                    "onclick='reject(" + data.tempScore_id + "," + data.isValid + ")'>" +
                    "<i class='fa fa-edit'></i> Reject</a>";
                html += "<a href='javascript:void(0);' class='up btn btn-default btn-xs'  data-toggle='modal'" +
                    "onclick='showLogs(" + data.referee.id + ")'>" +
                    "<i class='fa fa-edit'></i> 查看记录</a>";
                return html;
            }
        }]
    });


});

function showLogs(refid){
    var url = "/sports/referee/majorConfirm/showLog/" + refid;
    if(logTable == null){
        logTable = $('#logTable').DataTable({
            "select": true, //开启选择
            "searching": false,
            "paging":false,
            "responsive": true,
            "ajax": {
                url: url,
                data:{
                    compid: compid,
                    athid: athid
                },
                dataSrc: "",
            },
            "columns": [
                {"data": "id"},
                {"data": "score"},
                {"data": "isValid"},
            ],
            "columnDefs": [{
                "targets": 0,
                "searchable": false,
                "visible": false
            },{
                "targets":2,
                "render":function (data) {
                    var result = null;
                    if(data == null)
                        result = "未审核";
                    else if(data == 0)
                        result = "拒绝";
                    else
                        result = "接受"
                    return result;
                }
            }]
        });
    }else
        logTable.ajax.url(url).load();

    $("#scoreModal").modal("show");

}

function accept(tempId,isValid){
    var scoreAlert = $("#scoreAlert");

    //只有在未审核状态下才能进行操作
    if(isValid == null){
        var url = "/sports/referee/majorConfirm/accept/" + tempId;
        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            data: null,
            traditional: true,////这里设置为true,使传递参数变成 data:1
            url: url,
            success: function (result) {
                console.log(result, status);//打印服务端返回的数据(调试用)

                scoreAlert.children("strong").text("Accept operation success !!!");
                scoreAlert.removeClass("alert-danger").addClass("alert-success");
                table.ajax.reload();//刷新DataTable
            },
            error: function () {
                scoreAlert.children("strong").text("Accept operation fail !!!");
                scoreAlert.addClass("alert-danger").removeClass("alert-success");
            },
            complete: function () {
                $("#scoreModal").modal("hide");
                alertReport(scoreAlert);
            }
        })
    }else
        alertReport(scoreAlert);

}
function reject(tempId,isValid){
    var scoreAlert = $("#scoreAlert");

    //只有在未审核状态下才能进行操作
    if(isValid == null){
        var url = "/sports/referee/majorConfirm/reject/" + tempId;
        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            data: null,
            traditional: true,////这里设置为true,使传递参数变成 data:1
            url: url,
            success: function (result) {
                console.log(result, status);//打印服务端返回的数据(调试用)

                scoreAlert.children("strong").text("Reject operation success !!!");
                scoreAlert.removeClass("alert-danger").addClass("alert-success");
                table.ajax.reload();//刷新DataTable
            },
            error: function () {
                scoreAlert.children("strong").text("Reject operation fail !!!");
                scoreAlert.addClass("alert-danger").removeClass("alert-success");
            },
            complete: function () {
                $("#scoreModal").modal("hide");
                alertReport(scoreAlert);
            }
        })
    }else
        alertReport(scoreAlert);

}


function setFinalScore() {
    var scoreAlert = $("#scoreAlert");
    var scoreDatas = table.rows().data();
    var canFigure = true;

    //当全部的成绩都接受后，才可以计算最终成绩
    for(let i=0;i<scoreDatas.length;i++){
        if(scoreDatas[i].isValid == 0){
            canFigure = false;
            break;
        }
    }

    if(canFigure == true){
        //计算出平均成绩
        var total = 0.0;
        for(let i=0;i<scoreDatas.length;i++){
            total += scoreDatas[i].score;
        }
        //设置平均成绩
        $("#averageScoreLabel").text(total/(scoreDatas.length));

        $("#figureModal").modal("show");
    }else {
        scoreAlert.children("strong").text("You should accept all the score before you figure out the final score of this athlete !!!");
        scoreAlert.addClass("alert-danger").removeClass("alert-success");
        alertReport(scoreAlert);
    }
}

//当输入P , D变化时，动态计算并显示 finalScore的值
function changePoint() {
    //计算奖惩分
    var otherScore = $("#Dinput").val() - $("#Pinput").val();

    var avg = parseFloat($("#averageScoreLabel").text());

    $("#finalScoreLabel").text(avg + otherScore);

}

function figureOut() {
    var finalScore = parseFloat($("#figureModalLabel").text());
    var url = "/sports/referee/majorConfirm/setScore";

    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        contentType: "double",
        data: {
            compid: compid,
            athid: athid,
            finalScore: finalScore,
        },
        traditional: true,////这里设置为true,使传递参数变成 data:1
        url: url,
        success: function (result) {
            console.log(result, status);//打印服务端返回的数据(调试用)
            //刷新运动员最终成绩
            getFinalScore();
        },
        error: function () {
            alert("Set final score fail !!!");
        },
        complete: function () {
            $("#scoreModal").modal("hide");
        }
    });


}
function getFinalScore() {
    var scoreAlert = $("#scoreAlert");
    var url = "/sports/referee/majorConfirm/getFinalScore";
    $.ajax({
        type: "POST",//方法类型
        dataType: "double",//预期服务器返回的数据类型
        data: {
            compid: compid,
            athid: athid
        },
        traditional: true,////这里设置为true,使传递参数变成 data:1
        url: url,
        success: function (result) {
            console.log("final score: ...");
            console.log(result);//打印服务端返回的数据(调试用)

            scoreAlert.children("strong").text("Refresh final score success !!!");
            scoreAlert.removeClass("alert-danger").addClass("alert-success");
            $("#finalScore").text(result);
        },
        error: function () {
            scoreAlert.children("strong").text("Refresh final score fail !!!");
            scoreAlert.addClass("alert-danger").removeClass("alert-success");
        },
        complete: function () {
            $("#scoreModal").modal("hide");
            alertReport(scoreAlert);
        }
    });

}