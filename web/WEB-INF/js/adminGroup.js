var athTable = null;
var refTable = null;
var athGroupTable = null;
var majorRefTable = null;
var normalRefTable = null;
var comp_id = null;

//最大组号
var maxGroupNo = null;

$(document).ready(function () {

    comp_id = parseInt($("#comp_id").text().trim());
    console.log(comp_id);

    maxGroupNo = parseInt($("#groupNoSpan").text().trim());
    var urlAth = comp_id + "/ath";
    var urlRef = comp_id + "/ref";
    athTable = $("#groupAthTable").DataTable({
        "retrieve": true,
        "select": false, //开启选择
        "searching": false,
        //设置默认排序为第二列
        "order": [[ 1, 'asc' ]],
        "paging": false,
        "responsive": true,
        "ajax": {
            url: urlAth,
            dataSrc: ""
        },
        "columns": [
            {"data": "athlete.id"},
            {"data": "groupno"},
            {"data": "athlete.name"},
            {"data": "athlete.age"},
            {"data": "athlete.no"},
            {"data": "athlete.team.name"}
        ],
        "columnDefs": [{
            //隐藏第一列 id
            "targets": 0,
            "searchable": false,
            "visible": false
        }
        ]
    });

    refTable = $("#groupRefTable").DataTable({
        "retrieve": true,
        "select": false, //开启选择
        "searching": false,
        //设置默认排序为第二列
        "order": [[ 1, 'asc' ]],
        "paging": false,
        "responsive": true,
        "ajax": {
            url: urlRef,
            dataSrc: ""
        },
        "columns": [
            {"data": "referee.id"},
            {"data": "groupno"},
            {"data": "referee.name"},
            {"data": "reftype"},
        ],
        "columnDefs": [{
            //隐藏第一列 id
            "targets": 0,
            "searchable": false,
            "visible": false
        }, {
            "targets": 3,
            //data就是这个 td 内的值
            "render": function (data, row, type) {
                if (data == "0")
                    return "普通裁判";
                else
                    return "主裁判";
            }
        }
        ]
    });


    $('#athDataTableOfGroup tbody').on('click', 'td', function () {
        if ($(this).children("a").length == 0) {
            $(this).parent().toggleClass('selected');
            $(this).parent().toggleClass('table-active');
        }

    });

    $('#majorRefDataTableOfGroup tbody').on('click', 'td', function () {
        if ($(this).children("a").length == 0) {
            $(this).parent().toggleClass('selected');
            $(this).parent().toggleClass('table-active');
        }

    });

    $('#normalRefDataTableOfGroup tbody').on('click', 'td', function () {
        if ($(this).children("a").length == 0) {
            $(this).parent().toggleClass('selected');
            $(this).parent().toggleClass('table-active');
        }

    });


    $("#athGroupConfirm").click(function (e) {
        e.preventDefault();
        var select = $("#selectAlertAth");
        var sLength = athGroupTable.rows(".selected")[0].length;

        var totalLength = athGroupTable.rows().data().length;

        //设置选中的运动员的个数 （作为一组）
        if (totalLength >= 8 && sLength != 8) {
            select.removeClass("alert-danger").removeClass("alert-success").addClass("alert-warning");
            alertReport(select);
        } else {
            var selection = athGroupTable.rows(".selected").data();
            console.log(selection);
            var athIds = [];
            for (var i = 0; i < selection.length; i++) {
                athIds.push(selection[i].athlete.id);
            }
            console.log(athIds);
            var addGroupAthAlert = $("#addAlert");
            var url = comp_id + "/addAthGroup";
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                data: {
                    data: athIds
                },
                traditional: true,////这里设置为true,使传递参数变成 data:1
                url: url,
                success: function (result) {
                    console.log(result, status);//打印服务端返回的数据(调试用)

                    addGroupAthAlert.children("strong").text("Add group for athlete success !!!");
                    addGroupAthAlert.removeClass("alert-danger").addClass("alert-success");
                    athTable.ajax.reload();//刷新DataTable
                },
                error: function () {
                    addGroupAthAlert.children("strong").text("Add group for athlete fail !!!");
                    addGroupAthAlert.addClass("alert-danger").removeClass("alert-success");
                },
                complete: function () {
                    $("#addAthleteModal").modal("hide");
                    alertReport(addGroupAthAlert);
                }
            });
        }
        return false;
    });


    $("#refGroupConfirm").click(function (e) {
        e.preventDefault();
        var select = $("#selectAlertRef");
        var major = majorRefTable.rows(".selected").data();
        var normal = normalRefTable.rows(".selected").data();

        var legal = true;
        if (major.length == 1 && normal.length > 1 && normal.length < 5) {
            for (let i = 0; i < normal.length; i++) {
                if (normal[i].id == major[0].id) {
                    legal = false;
                    break;
                }
            }
        } else
            legal = false;

        if (legal == false) {
            select.removeClass("alert-danger").removeClass("alert-success").addClass("alert-warning");
            alertReport(select);
        } else {
            var normalIds = [];
            for (var i = 0; i < normal.length; i++) {
                normalIds.push(normal[i].id);
            }
            var addGroupRefAlert = $("#updateAlert");
            var url = comp_id + "/addRefGroup";
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                data: {
                    major: major[0].id,
                    normal: normalIds
                },
                traditional: true,////这里设置为true,使传递参数变成 data:1
                url: url,
                success: function (result) {
                    console.log(result, status);//打印服务端返回的数据(调试用)

                    if(result == true){
                        addGroupRefAlert.children("strong").text("Add group for referee success !!!");
                        addGroupRefAlert.removeClass("alert-danger").addClass("alert-success");
                        refTable.ajax.reload();//刷新DataTable

                        //最大组号加一
                        maxGroup();
                    }else {
                        addGroupRefAlert.children("strong").text("Add group for referee fail !!!");
                        addGroupRefAlert.addClass("alert-danger").removeClass("alert-success");
                    }

                },
                error: function () {
                    addGroupRefAlert.children("strong").text("Add group for referee fail !!!");
                    addGroupRefAlert.addClass("alert-danger").removeClass("alert-success");
                },
                complete: function () {
                    $("#addAthleteModal").modal("hide");
                    alertReport(addGroupRefAlert);
                }
            });
        }
        return false;
    });

});

function maxGroup() {
    maxGroupNo++;
    $("#groupNoSpan").text(maxGroupNo);
}

function setAthGroup() {

    var url = comp_id + "/ath/group";
    if (athGroupTable == null) {
        athGroupTable = $('#athDataTableOfGroup').DataTable({
            "select": true, //开启选择
            "searching": false,
            "paging": false,
            "responsive": true,
            "ajax": {
                url: url,
                dataSrc: ""
            },
            "columns": [
                {"data": "athlete.id"},
                {"data": "athlete.name"},
                {"data": "athlete.no"},
                {"data": "athlete.team.name"},
            ],
            "columnDefs": [{
                "targets": 0,
                "searchable": false,
                "visible": false
            }
            ]
        });
    } else
        athGroupTable.ajax.reload();

    $("#addAthleteModal").modal("show");
}

function setRefGroup() {
    var url = comp_id + "/ref/group";
    if (majorRefTable == null) {
        majorRefTable = $('#majorRefDataTableOfGroup').DataTable({
            "select": true, //开启选择
            "searching": false,
            "paging": false,
            "responsive": true,
            "ajax": {
                url: url,
                dataSrc: ""
            },
            "columns": [
                {"data": "id"},
                {"data": "name"},
                {"data": "team.name"}
            ],
            "columnDefs": [{
                "targets": 0,
                "searchable": false,
                "visible": true
            }
            ]
        });
    } else
        majorRefTable.ajax.reload();

    if (normalRefTable == null) {
        normalRefTable = $('#normalRefDataTableOfGroup').DataTable({
            "select": true, //开启选择
            "searching": false,
            "paging": false,
            "responsive": true,
            "ajax": {
                url: url,
                dataSrc: ""
            },
            "columns": [
                {"data": "id"},
                {"data": "name"},
                {"data": "team.name"}
            ],
            "columnDefs": [{
                "targets": 0,
                "searchable": false,
                "visible": true
            }
            ]
        });
    } else
        normalRefTable.ajax.reload();


    $("#addRefereeModal").modal("show");
}