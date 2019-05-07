
$(document).ready(function () {
    $("#coachDataTable").DataTable({
        "ajax": {
            type: "GET",
            dataType:"json",
            url:"sports/json/coach/list/1",
        },
        "columns": [
            {"data":"id"},
            {"data":"name"},
            {"data":"sex"},
            {"data":"phone"},
            {"data":"coachID"}
        ]
    });


    // coachTable.on( 'xhr', function () {
    //     var json = coachTable.ajax.json();
    //     alert( json.data.length +' row(s) were loaded' );
    // } );

});

function refreshTable(){
    $.ajax({
        type: "GET",
        dataType: "json",
        url: "sports/json/coach/list",
        success: function (data) {

        }
    })
}


//添加教练表单
$("#addCoach").submit(function (event) {
    event.preventDefault();
    var $form = $(this);
    var uuu = $form.attr("action");
    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: $form.attr("action"),//url
        data: $form.serialize(),
        success: function (result) {
            console.log(result, status);//打印服务端返回的数据(调试用)
            var as1 = status;
            alert("SUCCESS");
            $("#addModal").modal("hide");
        }
        // error : function() {
        //     alert("异常！");
        // }
    });
})
