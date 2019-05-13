var compTable = null;
var signTable = null;
var comp_id = null; //报名的比赛 id
$(document).ready(function () {//TODO 不行就返回jsp
    // compTable =
    $("#compDataTable").DataTable({
        // "select": true, //开启选择
        "searching": true,
        "responsive": true,
        "ajax": {
            url: "/sports/team/sign/competition",
            dataSrc: ""
        },
        "columns": [
            {"data": "id"},
            {"data": "project"},
            {"data": "sexgroup"},
            {"data": "agegroup"},
            {"data": "isSign"},
            {"data": null}
        ],
        "columnDefs": [{
            "targets":0,
            "searchable":false,
            "visible":false
        },
            {
                "targets": 5,//操作按钮目标列
                "data": null,
                "render": function (data, type, row) {
                    var id = '"' + row.id + '"';
                    var html = "<a href='javascript:void(0);' class='delete btn btn-default btn-xs' " +
                        "data-toggle='modal' onclick='sign(' " + data.id +")'>" +
                        "<i class='fa fa-file-alt'></i> 报名</a>";
                    return html;
                }
            }]
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

//关闭警告框
function hideAlert(ele){
    var alert = $(ele).parent();
    console.log(alert);
    alert.hide();
}

//提交报名
$("#signUpSub").submit(function (e) {
    e.preventDefault();
    var selection = signTable.rows(".selected").data();
    console.log(selection);
    var addAthIds = [];
    for(var i=0;i<selection.length;i++){
        addAthIds.push(selection[i].id);
    }
    var signAlert = $("#signAlert");
    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        data:{
            data:addAthIds
        },
        traditional:true,////这里设置为true,使传递参数变成 data:1
        url: "/sports/team/signUp" + comp_id,
        success: function (result) {
            console.log(result, status);//打印服务端返回的数据(调试用)

            signAlert.children("strong").text("Sign up operation success !!!");
            signAlert.removeClass("alert-danger").addClass("alert-success");
            compTable.ajax.reload();//刷新DataTable
            refreshColor();
        },
        error : function() {
            signAlert.children("strong").text("Sign up operation fail !!!");
            signAlert.addClass("alert-danger").removeClass("alert-success");
        },
        complete:function () {
            $("#signModal").modal("hide");
            alertReport(signAlert);
        }
    });

});

//显示报名表
function sign(compid) {
    var url = "/sports/team/sign/" + compid;
    comp_id = compid;
    signTable = $('#athDataTableOfSign').DataTable({
        "select": true, //开启选择
        "searching": false,
        "responsive": true,
        "ajax": {
            url: url,
            dataSrc: ""
        },
        "columns": [
            {"data": "id"},
            {"data": "name"},
            {"data": "age"},
        ],
        "columnDefs": [{
            "targets":0,
            "searchable":false,
            "visible":false
        }]
    });

    $("#signModal").modal("show");

}

function refreshColor() {
    var allSign = $("#compDataTable tbody tr td:nth-child(5)");
    var child = null;
    for(let i = 0;i < allSign.length;i++){
        child = $(allSign[i]);
        console.log(child.text());
        if( child.text() == "是"){
            child.parent().addClass("bg-success").addClass("text-white");
            child.next().addClass("disabled");
        }
    }
}