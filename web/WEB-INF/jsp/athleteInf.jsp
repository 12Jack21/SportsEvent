<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/12
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AthleteInf</title>
    <jsp:include page="commom_css_js.jsp"></jsp:include>
</head>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <jsp:include page="teamSidebar.jsp"></jsp:include>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <jsp:include page="teamTopbar.jsp"></jsp:include>

            <!-- Begin Page Content -->
            <div class="container-fluid">
<%--                <!--面包屑导航-->--%>
<%--                <nav aria-label="breadcrumb">--%>
<%--                    <ol class="breadcrumb">--%>
<%--                        <li class="breadcrumb-item"><a href="__athlete.html">Athlete List</a></li>--%>
<%--                        <li class="breadcrumb-item"><a href="#">Library</a></li>--%>
<%--                        <li class="breadcrumb-item active" aria-current="page">Data</li>--%>
<%--                    </ol>--%>
<%--                </nav>--%>

                <!--update警告框-->
                <div class="alert fade show" role="alert" id="updateAlert" hidden="hidden">
                    <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong></strong>
                </div>
                <!--运动员信息-->
                <div class="card shadow mb-12">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-1 d-flex flex-row align-items-center justify-content-between">
                        <h4 class="m-0 font-weight-bold text-primary">Information</h4>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3 ">
                                <div class="">
                                    <c:choose><c:when
                                            test="${athlete.sex == 1}">
                                        <img src="/sports/img.action/athlete_male.png" alt="male athlete"
                                             style="border-radius: 50%;overflow: auto;width: 100%;"/></c:when>
                                        <c:otherwise>
                                            <img src="/sports/img.action/athlete_female.png" alt="female athlete"
                                                 style="border-radius: 50%;overflow: auto;width: 100%;"/></c:otherwise>
                                    </c:choose>

                                </div>
                            </div>
                            <div class="col-lg-6 offset-md-1 offset-lg-0" id="athInf">
                                <div style="margin-bottom: 4%">
                                    <h3 style="float: left;margin-right: 1%">${athlete.name}</h3>
                                    <!--TODO 修改信息 undid-->
                                    <button class="btn" data-toggle="modal" id="editBtn">
                                        <i class="fas fa-lg fa-edit"></i></button>
                                </div>
                                <div>
                                    <span class="text-lg float-left">Gender: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        <c:choose><c:when
                                                test="${athlete.sex == 0}">女</c:when>
                                            <c:otherwise>男</c:otherwise>
                                        </c:choose>
                                        <c:choose><c:when
                                                test="${athlete.sex == 1}">
                                            <i class="fas fa-lg fa-mars"></i>
                                        </c:when>
                                            <c:otherwise><i class="fas fa-lg fa-female"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                                <div>
                                    <span class="text-lg float-left">Age: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        ${athlete.age}
                                    </p>
                                </div>
                                <div>
                                    <span class="text-lg float-left">ID: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        ${athlete.athID}
                                    </p>
                                </div>
                                <div>
                                    <span class="text-lg float-left">No: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        <c:choose><c:when
                                                test="${athlete.no == null}">未定</c:when>
                                            <c:otherwise>${athlete.no}</c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--分隔上下卡片-->
                <div style="margin-bottom: 30px"></div>

                <!--参赛信息-->
                <div class="card shadow mb-12">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h3 class="m-0 font-weight-bold text-primary">Participation</h3>
                        <div class="dropdown no-arrow">
                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                 aria-labelledby="dropdownMenuLink">
                                <div class="dropdown-header">Dropdown Header:</div>
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                        <!--标签导航-->
                        <div class="row justify-content-around" style="margin-left: auto;margin-right: auto">
                            <div class="col-lg-6 text-center text-primary" id="iniTab" href="#initial"
                                 data-toggle="tab">
                                <div style="margin-top: 10px;margin-bottom: 10px;">
                                    <a class="text-lg">Initial Game</a>
                                </div>
                            </div>
                            <div class="col-lg-6 text-center text-primary" id="finTab" href="#final"
                                 data-toggle="tab">
                                <div style="margin-top: 10px;margin-bottom: 10px;">
                                    <a class=" text-lg">Final Game</a>
                                </div>
                            </div>
                        </div>
                        <div id="myTabContent" class="tab-content ">
                            <!--面板-->
                            <div class="tab-pane fade in active borderAround2" id="initial">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover dataTableOfRef ">
                                        <thead>
                                        <tr>
                                            <th hidden="hidden">id</th>
                                            <th>Project</th>
                                            <th>SexGroup</th>
                                            <th>AgeGroup</th>
                                            <th>Type</th>
                                            <th>GroupNo</th>
                                            <th>Score</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${initials}" var="ini">
                                            <tr>
                                                <td hidden="hidden">${ini.competitionVO.id}</td>
                                                <td>${ini.competitionVO.project}</td>
                                                <td>${ini.competitionVO.sexgroup}</td>
                                                <td>${ini.competitionVO.agegroup}</td>
                                                <td>${ini.competitionVO.type}</td>
                                                <td>${ini.groupno}</td>
                                                <td>${ini.score}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="text-center">
                                        <h3 id="iniTotal"></h3>
                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane fade in borderAround2" id="final">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover dataTableOfRef">
                                        <thead>
                                        <tr>
                                            <th hidden="hidden">id</th>
                                            <th>Project</th>
                                            <th>SexGroup</th>
                                            <th>AgeGroup</th>
                                            <th>Type</th>
                                            <th>GroupNo</th>
                                            <th>Score</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <!--TODO 考虑加入进入比赛信息的界面，以查看排名-->
                                        <c:forEach items="${finals}" var="fi">
                                            <tr>
                                                <td hidden="hidden">${fi.competitionVO.id}</td>
                                                <td>${fi.competitionVO.project}</td>
                                                <td>${fi.competitionVO.sexgroup}</td>
                                                <td>${fi.competitionVO.agegroup}</td>
                                                <td>${fi.competitionVO.type}</td>
                                                <td>${fi.groupno}</td>
                                                <td>${fi.score}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="text-center">
                                        <h3 id="fiTotal"></h3>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- End of Main Content -->

                <div class="row">
                </div>
                <!-- End of Main Content -->

            </div>
            <!-- End of Content Wrapper -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; My Manage Website 2019</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!--Edit Modal-->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
             aria-hidden="true">
            <div class="modal-dialog " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-primary" id="editModalLabel">Update information</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body text-lg">
                        <form id="athInfUpdate" action="${pageContext.request.contextPath}/team/athlete/update">
                            <input name="id" value="${athlete.id}" hidden="hidden">
                            <div class="form-group">
                                <label for="nameInput">Name</label>
                                <input type="text" class="form-control" id="nameInput" placeholder="your new name"
                                       name="name">
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="maleradio" value="1" name="sex">
                                <label class="form-check-label" for="maleradio">Male</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="femaleradio" value="0" name="sex">
                                <label class="form-check-label" for="femaleradio">Female</label>
                            </div>
                            <div class="form-group">
                                <label for="ageInput">Age</label>
                                <input type="number" class="form-control" id="ageInput" placeholder="age" name="age">
                            </div>
                            <div class="form-group">
                                <label for="IDInput">ID</label>
                                <input type="text" class="form-control" id="IDInput" placeholder="your id" name="athID">
                            </div>
                            <button type="submit" class="btn btn-lg btn-primary ">Submit</button>
                        </form>
                        <hr style="height: 10%;">
                        <!--未更改表单的警告框-->
                        <div class="alert alert-warning fade show" role="alert" id="uAlert" hidden="hidden">
                            <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <strong>You should change some form attributes before you update.</strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script>
    var updateData = null;
    $(document).ready(function () {
        getTotalScore();

        $("#editBtn").click(function (e) {
            var name = $("#athInf div h3").text();
            var sex = $("#athInf div:nth-child(2) p").text();
            var age = parseInt($("#athInf div:nth-child(3) p").text());

            //TODO 说明jsp 的EL表达式可以用在 js 中
            var athID = $("#athInf div:nth-child(4) p").text().trim();
            console.log(sex.trim());
            updateData = [name,sex.trim(),age,athID];

            $("#nameInput").val(name);
            if(sex.trim() == "男")
                $("#maleradio").attr("checked",true);
            else
                $("#femaleradio").attr("checked",true);
            $("#ageInput").val(age);
            $("#IDInput").val(athID);

            $("#editModal").modal("show");
        })

    });

    function getTotalScore(){
        var iniTotal = 0.0;
        var fiTotal = 0.0;

        var ini = $("#initial tbody tr td:nth-child(7)");
        var fi = $("#final tbody tr td:nth-child(7)");

        for (let i = 0; i < ini.length; i++) {
            iniTotal += parseFloat($(ini[i]).text());
        }

        for (let i = 0; i < fi.length; i++) {
            fiTotal += parseFloat($(fi[i]).text());
        }

        $("#iniTotal").text("Initial total score: " + iniTotal);
        $("#fiTotal").text("Final total score: " + fiTotal);
    }

    $("#athInfUpdate").submit(function (event) {
        event.preventDefault();
        var name = $("#nameInput").val();
        var age = $("#ageInput").val();
        var ID = $("#IDInput").val();
        var maleCheck = $("#maleradio").prop("checked");

        var male = null;
        if(updateData[1] == "男")
            male = true;
        else
            male = false;

        console.log(updateData);
        if (updateData[0] == name && male == maleCheck
            && updateData[2] == age && updateData[3] == ID) {
            //表单未更新
            alertReport($("#uAlert"));

        } else {
            var $form = $(this);
            var data = $form.serialize();
            console.log(data);
            var url = $form.attr("action");
            console.log(url);
            var update = $("#updateAlert");

            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: url,
                traditional: true,
                data: data,
                success: function (result) {
                    console.log(result, status);//打印服务端返回的数据(调试用)

                    update.children("strong").text("Update athlete success !!!");
                    update.removeClass("alert-danger").removeClass("alert-warning").addClass("alert-success");

                    //刷新运动员信息
                    $("#athInf div h3").text(name);
                    if(maleCheck == true)
                        $("#athInf div:nth-child(2) p").text("男");
                    else
                        $("#athInf div:nth-child(2) p").text("女");
                    $("#athInf div:nth-child(3) p").text(age);
                    $("#athInf div:nth-child(4) p").text(ID);
                },
                error: function () {
                    update.children("strong").text("Update athlete fail !!!");
                    update.addClass("alert-danger").removeClass("alert-success").removeClass("alert-warning");
                },
                complete: function () {
                    $("#editModal").modal("hide");
                    alertReport(update);

                }
            });
        }

    });

</script>
</body>

</html>
