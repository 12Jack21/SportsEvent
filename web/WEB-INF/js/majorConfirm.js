var table = null;
var logTable = null;
var compid = null; //比赛 id
var athid = null;

$(document).ready(function () {
    athid = parseInt($("#athid").text().trim());
    compid = parseInt($("#compid").text().trim());
    console.log(athid);
    console.log(compid);
    var url = "/sports/referee/majorConfirm/refList";
    table = $("#dataTableMajorConfirm").DataTable({
        "select": false, //开启选择
        "responsive": true,
        "traditional": true,
        "searching" : false, //去掉搜索框方法一
        "bFilter": false,   //去掉搜索框方法二
        "bSort": false,  //禁止排序
        "paging": false,   //禁止分页
        "info": false,   //去掉底部文字
        "ajax": {
            url: url,//TODO
            data: {
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
            // {"data": "isValid"},
            {"data": null},
            {"data": null}
        ],
        "columnDefs": [{
            "targets": 0,
            "searchable": false,
            "visible": false
        }, {
            "targets": 4,
            "data": null,
            "render": function (data, type, row) {
                console.log(data);
                if (data.score == null || data.score == 0.0)
                    return "未给分";
                if (data.isValid == null)
                    return "未审核";
                var isValid = parseInt(data.isValid);
                if (isValid == 1)
                    return "接受";
                else
                    return "拒绝";
            }
        }, {
            "targets": 5,//操作按钮目标列
            "data": null,
            //data 为null时，可以取到整个的对象数据，不为null时，只能取到当前给定的单元格的值
            "render": function (data, type, row) {
                var id = '"' + row.id + '"';
                var html = "<a href='javascript:void(0);' class='up btn btn-default btn-xs text-success' " +
                    "onclick='accept(" + data.tempScore_id + "," + data.isValid + "," + data.score + ")'>" +
                    "<i class='fa fa-edit'></i> Accept</a>";
                html += "<a href='javascript:void(0);' class='up btn btn-default btn-xs text-danger'" +
                    "onclick='reject(" + data.tempScore_id + "," + data.isValid + "," + data.score + ")'>" +
                    "<i class='fa fa-edit'></i> Reject</a>";
                html += "<a href='javascript:void(0);' class='up btn btn-default btn-xs'  data-toggle='modal'" +
                    "onclick='showLogs(" + data.referee.id + ")'>" +
                    "<i class='fa fa-edit'></i> 查看记录</a>";
                return html;
            }
        }]
    });


});

function showLogs(refid) {
    var url = "/sports/referee/majorConfirm/showLog/" + refid;
    if (logTable == null) {
        logTable = $('#logTable').DataTable({
            "select": true, //开启选择
            "searching": false,
            "paging": false,
            "responsive": true,
            "ajax": {
                url: url,
                data: {
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
            }, {
                "targets": 2,
                "render": function (data) {
                    var result = null;
                    if (data == null)
                        result = "未审核";
                    else if (data == 0)
                        result = "拒绝";
                    else
                        result = "接受"
                    return result;
                }
            }]
        });
    } else
        logTable.ajax.url(url).load();

    $("#scoreModal").modal("show");

}

function accept(tempId, isValid, score) {
    var scoreAlert = $("#scoreAlert");

    //只有在未审核状态下才能进行操作
    if (isValid == null && score != null && score != 0.0) {
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
    } else {
        scoreAlert.children("strong").text("Accept operation should execute if the state is unchecked !!!");
        scoreAlert.addClass("alert-danger").removeClass("alert-success");
        alertReport(scoreAlert);
    }

}

function reject(tempId, isValid, score) {
    var scoreAlert = $("#scoreAlert");

    //只有在未审核状态下才能进行操作
    if (isValid == null && score != null && score != 0.0) {
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
    } else {
        scoreAlert.children("strong").text("Reject operation should execute if the state is unchecked !!!");
        scoreAlert.addClass("alert-danger").removeClass("alert-success");
        alertReport(scoreAlert);
    }

}

//显示给分modal
function setFinalScore() {
    var scoreAlert = $("#scoreAlert");
    var scoreDatas = table.rows().data();
    var canFigure = true;

    //当全部的成绩都接受后，才可以计算最终成绩
    for (let i = 0; i < scoreDatas.length; i++) {
        if (scoreDatas[i].isValid == 0 || scoreDatas[i].score == null) {
            canFigure = false;
            break;
        }
        // if (scoreDatas[i].isValid == 0) {
        //     canFigure = false;
        //     break;
        // }
    }

    if (canFigure == true) {
        //计算出平均成绩
        var total = 0.0;

        //裁判人数大于四，进行去掉最高分和最低分的操作
        if(scoreDatas.length >=4 ){
            var maxData = scoreDatas[0];
            var minData= scoreDatas[0];
            for (var i = 0; i < scoreDatas.length; i++) {
                if (scoreDatas[i]>maxData) {
                    maxData = scoreDatas[i];  // 最大值
                };
                if (scoreDatas[i]<minData) {
                    minData = scoreDatas[i];  // 最小值
                }
            }

            for (let i = 0; i < scoreDatas.length; i++) {
                total += scoreDatas[i].score;
            }
            //设置平均成绩
            $("#averageScoreLabel").text((total - minData - maxData) / (scoreDatas.length - 2));
            $("#finalScoreLabel").text((total - minData - maxData) / (scoreDatas.length - 2));
        }else {
            for (let i = 0; i < scoreDatas.length; i++) {
                total += scoreDatas[i].score;
            }
            //设置平均成绩
            $("#averageScoreLabel").text(total / (scoreDatas.length));
            $("#finalScoreLabel").text(total / (scoreDatas.length));
        }

        $("#figureModal").modal("show");

    } else {
        scoreAlert.children("strong").text("You should accept all the score before you figure out the final score of this athlete !!!");
        scoreAlert.addClass("alert-danger").removeClass("alert-success");
        alertReport(scoreAlert);
    }
}

//当输入P , D变化时，动态计算并显示 finalScore的值
function changePoint() {
    let dPoint = $("#Dinput").val();
    let pPoint = $("#Pinput").val();
    //限制范围在 0-10 之间
    if (dPoint > 10) {
        $("#Dinput").val(10.0);
    } else if (dPoint < 0) {
        $("#Dinput").val(0.0);
    }
    if (pPoint > 10) {
        $("#Pinput").val(10.0);
    } else if (pPoint < 0) {
        $("#Pinput").val(0.0);
    }

    dPoint = $("#Dinput").val();
    pPoint = $("#Pinput").val();

    //计算奖惩分
    var otherScore = dPoint - pPoint;

    var avg = parseFloat($("#averageScoreLabel").text());

    //保留两位小数
    let score = (avg + otherScore).toFixed(2);
    $("#finalScoreLabel").text(score);

}

//最终成绩提交
function figureOut() {
    var finalScore = parseFloat($("#finalScoreLabel").text());
    console.log("final score:...");
    console.log(finalScore);
    var url = "/sports/referee/majorConfirm/setScore";

    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
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
            //刷新给分表单
            $("#finalForm")[0].reset();
            changePoint();
        },
        error: function () {
            alert("Set final score fail !!!");
        },
        complete: function () {
            $("#scoreModal").modal("hide");
        }
    });


}

//得到最新的最终成绩
function getFinalScore() {
    var scoreAlert = $("#scoreAlert");
    var url = "/sports/referee/majorConfirm/getFinalScore";
    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        data: {
            compid: compid,
            athid: athid
        },
        traditional: true,////这里设置为true,使传递参数变成 data:1
        url: url,
        success: function (result) {
            console.log("Final score: \n");
            console.log(result);//打印服务端返回的数据(调试用)

            scoreAlert.children("strong").text("Refresh final score success !!!");
            scoreAlert.removeClass("alert-danger").addClass("alert-success");
            $("#finalScore").text(result);
        },
        error: function (result) {
            console.log("Error when refresh,result: ");
            console.log(result);//打印服务端返回的数据(调试用)
            scoreAlert.children("strong").text("Refresh final score fail !!!");
            scoreAlert.addClass("alert-danger").removeClass("alert-success");
        },
        complete: function () {
            $("#scoreModal").modal("hide");
            alertReport(scoreAlert);
        }
    });

}