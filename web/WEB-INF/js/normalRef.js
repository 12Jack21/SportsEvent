var table = null;
var logTable = null;
var jud_id = null; //报名的比赛 id

$(document).ready(function () {
    jud_id = parseInt($("#jud_id").text().trim());
    var url = "/sports/referee/tempScore/list";
    // TempScore
    table = $("#dataTableNormalRef").DataTable({
        "select": false, //开启选择
        "searching": true,
        "responsive": true,
        "traditional":true,
        "ajax": {
            url: url,//TODO
            data:{
                jud_id: parseInt($("#jud_id").text())
            },
            dataSrc: ""
        },
        "columns": [
            {"data": "athlete.id"},
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
            "render": function (data, type, row) {
                var id = '"' + row.id + '"';
                console.log(data.athlete.id);//用于调试
                var html = "<form  style='width: 300px;'><div class='form-inline'><input class='form-control' style='width: 100px;' " +
                    "type='number' step='0.01' name='score' id='athScore'>" +
                    "<button type='button' class='btn btn-primary' onclick='setScore(" + data.athlete.id + ",this)'>给分</button>";
                html += "<a href='javascript:void(0);' class='up btn btn-default btn-xs'  data-toggle='modal' " +
                    "onclick='showLog(" + data.athlete.id + ")'>" +
                    "<i class='fa fa-edit'></i> 查看记录</a>";
                html += "</div></form>";
                return html;
            }
        }]
    });


});

function showLog(athid){
    var url = "/sports/referee/tempScore/log";
    if(logTable == null){
        logTable = $('#scoreLogTable').DataTable({
            "select": true, //开启选择
            "searching": false,
            "paging":false,
            "responsive": true,
            "ajax": {
                url: url,
                data:{
                  jud_id: jud_id,
                  ath_id: athid
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
                "render":function (data, row) {
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

function setScore(athid,btn){
    var scoreAlert = $("#scoreAlert");
    var score = $(btn).parent().children("input").val();
    if(score == "" || score == null ||
        parseFloat(score) > 10.0 || parseFloat(score) < 0.0){
        scoreAlert.children("strong").text("Score should not be null and is between 0.0 and 10.0 !!!");
        scoreAlert.addClass("alert-danger").removeClass("alert-success");
        alertReport(scoreAlert);
    }else {
        var url = "/sports/referee/tempScore/add";
        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            data: {
                ath_id: athid,
                jud_id: parseInt($("#jud_id").text()),
                score: score
            },
            traditional: true,////这里设置为true,使传递参数变成 data:1
            url: url,
            success: function (result) {
                console.log(result, status);//打印服务端返回的数据(调试用)

                scoreAlert.children("strong").text("Score operation success !!!");
                scoreAlert.removeClass("alert-danger").addClass("alert-success");
                table.ajax.reload();//刷新DataTable
            },
            error: function () {
                scoreAlert.children("strong").text("Score operation fail !!!");
                scoreAlert.addClass("alert-danger").removeClass("alert-success");
            },
            complete: function () {
                $("#scoreModal").modal("hide");
                alertReport(scoreAlert);
            }
        });
    }


}