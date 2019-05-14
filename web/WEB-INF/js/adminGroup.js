var athTable = null;
var refTable = null;
var refGroupTable = null;
var majorRefTable = null;
var normalRefTable = null;


$(document).ready(function () {

    athTable = $("#groupAthTable").DataTable({
        "retrieve":true,
        "select":false, //开启选择
        "searching":false,
        "paging":false,
        "responsive":true,
        "ajax": {
            url:"ath",
            dataSrc:""
        },
        "columns": [
            {"data":"id"},
            {"data":"groupno"},
            {"data":"name"},
            {"data":"age"},
            {"data":"no"},
            {"data":"team.name"}
        ],
        "columnDefs": [{
            //隐藏第一列 id
            "targets":0,
            "searchable":false,
            "visible":false
        }
        ]
    });

    refTable = $("#groupRefTable").DataTable({
        "retrieve":true,
        "select":false, //开启选择
        "searching":false,
        "paging":false,
        "responsive":true,
        "ajax": {
            url:"ref",
            dataSrc:""
        },
        "columns": [
            {"data":"id"},
            {"data":"groupno"},
            {"data":"name"},
            {"data":"type"},
        ],
        "columnDefs": [{
            //隐藏第一列 id
            "targets":0,
            "searchable":false,
            "visible":false
        }
        ]
    });

});

function setAthGroup() {
    var url = "ath/group";
    if(refGroupTable == null){
        refGroupTable = $('#athDataTableOfGroup').DataTable({
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
                {"data": "no"},
                {"data": "team.name"},
            ],
            "columnDefs": [{
                "targets": 0,
                "searchable": false,
                "visible": false
            }
            ]
        });
    }else
        refGroupTable.ajax.reload();

    $("#addAthleteModal").modal("show");
}

function setRefGroup() {
    var url = "majorRef/group";
    if(majorRefTable == null){
        majorRefTable = $('#majorRefDataTableOfGroup').DataTable({
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
                {"data": "team.name"}
            ],
            "columnDefs": [{
                "targets": 0,
                "searchable": false,
                "visible": false
            }
            ]
        });
    }else
        majorRefTable.ajax.reload();


    url = "normalRef/group";
    if(normalRefTable == null){
        normalRefTable = $('#normalRefDataTableOfGroup').DataTable({
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
                {"data": "team.name"}
            ],
            "columnDefs": [{
                "targets": 0,
                "searchable": false,
                "visible": false
            }
            ]
        });
    }else
        normalRefTable.ajax.reload();


    $("#addRefereeModal").modal("show");
}