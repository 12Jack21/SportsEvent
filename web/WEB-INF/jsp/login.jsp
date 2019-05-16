<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/16
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LoginPage</title>
    <jsp:include page="commom_css_js.jsp"></jsp:include>
</head>
<body class="bg-gradient-primary">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Welcome!</h1>
                                </div>
                                <form class="user ">
                                    <div class="btn-group " data-toggle="buttons" style="width: 100%;" id="labelGroup">
                                        <label class="btn btn-primary active" id="label1">
                                            Team
                                        </label>
                                        <label class="btn btn-primary" id="label2">
                                            Referee
                                        </label>
                                        <label class="btn btn-primary" id="label3">
                                            Admin
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-user"
                                               id="firstInput" placeholder="Enter the team's username"
                                                autocomplete="on">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user"
                                               id="secondInput" placeholder="Enter the team's password"
                                               autocomplete="on">
                                    </div>

                                    <a href="javascript:void(0)" class="btn btn-primary btn-user btn-block" id="loginBtn">
                                        Login
                                    </a>
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                                </div>

                                <!--登陆提示警告框-->
                                <div class="alert fade show" role="alert" id="loginAlert" hidden="hidden">
                                    <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <strong></strong>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

        </div>

    </div>

</div>

<script>
    var tag = 0; // 0, 1, 2
    $(document).ready(function () {

        var login = $("#loginBtn");
        var first = $("#firstInput");
        var second = $("#secondInput");
        $("#labelGroup").on("click","label",function () {
            console.log($(this),".......",$(this).text());
            $("#labelGroup").find("*").removeClass("active");
            $(this).addClass("active");
            $(this).button("toggle");

            if($(this).text().trim() == "Team"){
                tag = 0;
                first.attr("placeholder","Enter the team's username");
                second.attr("placeholder","enter the team's password");
            }else if($(this).text().trim() == "Referee"){
                tag = 1;
                first.attr("placeholder","Enter the referee's name");
                second.attr("placeholder","enter the referee's username");
            }else {
                tag = 2;
                first.attr("placeholder","Enter the admin's username");
                second.attr("placeholder","enter the admin's password");
            }
        });

        login.click(function (e) {
            e.preventDefault();

            var url = "/sports/login/confirm";

            var loginAlert = $("#loginAlert");
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                data: {
                    first: first.val(),
                    second: second.val(),
                    tag: tag
                },
                traditional: true,////这里设置为true,使传递参数变成 data:1
                url: url,
                success: function (result) {
                    console.log("Result is: ",result);//打印服务端返回的数据(调试用)
                    console.log(result.canLogin,"attr");
                    if(result.canLogin == true){
                        loginAlert.children("strong").text("Login success !!!");
                        loginAlert.removeClass("alert-danger").addClass("alert-success");
                        alertReport(loginAlert);

                        // 3秒后登陆主界面
                        setTimeout(function () {
                            window.location.href = result.location;
                        },1000);

                    }else {
                        if(tag == 1)
                            loginAlert.children("strong").text("There is something wrong in your name or username !!!");
                        else
                            loginAlert.children("strong").text("There is something wrong in your username or password !!!");
                        loginAlert.addClass("alert-danger").removeClass("alert-success");
                        alertReport(loginAlert);
                    }

                },
                error: function () {
                    loginAlert.children("strong").text("Login fail !!!");
                    loginAlert.addClass("alert-danger").removeClass("alert-success");
                    alertReport(loginAlert);

                },
            })


        })

    });
    $(document).keyup(function(event){
        if(event.keyCode ==13){
            $("#loginBtn").trigger("click");
        }
    });

</script>

</body>

</html>
