<%--
  Created by IntelliJ IDEA.
  User: 30978
  Date: 2022/3/21
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<jsp:forward page="/emps"></jsp:forward>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>index</title>--%>
<%--    <!--引入jquery-->--%>
<%--    <script type="text/javascript" src="static/js/jquery-3.5.1.js"></script>--%>
<%--    <!--引入样式-->--%>
<%--    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.4.1-dist/css/bootstrap.min.css">--%>
<%--    <script type="text/css" src="static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<button class="btn btn-success">按钮</button>--%>
<%--</body>--%>
<%--</html>--%>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <!--引入jquery-->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.5.1.js"></script>
    <!--引入bootstracp-->
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" type="text/css">
    <script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!--员工修改-->
<div class="modal fade" id="emp_update_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_update" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_update_M" value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_update_F" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!--部门提交Id即可-->
                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
<!--员工模态框-->
<div class="modal fade" id="emp_add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_add_M" value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_add_F" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!--部门提交Id即可-->
                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<!--搭建显示页面-->
<div class="container">
    <!--标题-->
    <div class="row">
        <div class="col-md-4">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!--按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-success" id="emp_add_btn">新增</button>
            <button type="button" class="btn btn-danger" id="del_all_btn">删除</button>
        </div>
    </div>
    <!--表格-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all">
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <!--分页信息-->
    <div class="row">
        <div class="col-md-6" id="page_info">

        </div>
        <div class="col-md-6" id="page_nav">

        </div>
    </div>
</div>
<script type="text/javascript">
    //定义全局变量总记录数
    var totalRecord;
    //定义全局变量当前页码
    var currentPage;
    //页面加载完成以后，直接发送ajax请求，要到分页数据
    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pn=" + pn,
            type: "get",
            success: function (result) {
                // console.log(result);
                //解析并解析员工数据
                build_emps_table(result);
                //解析并显示分页信息
                build_page_info(result);
                //解析并显示分页条信息
                build_page_nav(result);
            }
        });
    }

    function build_emps_table(result) {
        //emps_table
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            var checkBoxId = $("<td><input type='checkbox' class='check_item'></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var gender = item.gender == "M" ? "男" : "女";
            var genderTd = $("<td></td>").append(gender);
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-success btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("edit-id", item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id", item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxId).append(empIdTd).append(empNameTd).append(genderTd).append(emailTd)
                .append(deptNameTd).append(btnTd).appendTo("#emps_table tbody");
        })
    }

    function build_page_info(result) {
        //page_info
        $("#page_info").empty();
        $("#page_info").append("当前" + result.extend.pageInfo.pageNum + "页,总共" +
            result.extend.pageInfo.pages + "页,总共" + result.extend.pageInfo.total + "条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    function build_page_nav(result) {
        //page_nav
        $("#page_nav").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPage = $("<li></li>").append($("<a></a>").append("首页"));
        var prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPage.addClass("disabled");
            prePage.addClass("disabled");
        } else {
            firstPage.click(function () {
                to_page(1);
            });
            prePage.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }
        ul.append(firstPage).append(prePage);
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (item == result.extend.pageInfo.pageNum) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        var nextPage = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPage = $("<li></li>").append($("<a></a>").append("末页"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPage.addClass("disabled");
            lastPage.addClass("disabled");
        } else {
            nextPage.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPage.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }
        ul.append(nextPage).append(lastPage);
        $("<nav></nav>").append(ul).appendTo("#page_nav");
    }

    function reset_form(ele) {
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-success has-error");
        $(ele).find(".help-block").text("");
    }

    //点击按钮跳出新增模态框
    $("#emp_add_btn").click(function () {
        //完全重置
        reset_form("#emp_add_modal form");
        //清除表单数据（表单重置）
        // $("#emp_add_modal form")[0].reset();
        //发送ajax请求，查出部门信息，显示在下拉框
        getDepts("#emp_add_modal select");
        //弹出模态框
        $("#emp_add_modal").modal({
            backdrop: "static"
        });
    });

    function getDepts(ele) {
        $.ajax({
            url: "${APP_PATH}/depts",
            type: "get",
            success: function (result) {
                // console.log(result);
                //显示部门在下拉列表
                $(ele).empty();
                $.each(result.extend.depts, function () {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        });
    }

    function validate_add_form() {
        var empName = $("#empName_add").val();
        var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {
            // alert("用户名需为2-5位汉字或3-16位大小写字母字符组合");
            show_validate_msg("#empName_add", "error", "用户名需为2-5位汉字或3-16位大小写字母字符组合");
            return false;
        } else {
            show_validate_msg("#empName_add", "success", "");
        }
        var email = $("#email_add").val();
        var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            // alert("邮箱格式不正确");
            show_validate_msg("#email_add", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validate_msg("#email_add", "success", "");
        }
        return true;
    }

    function show_validate_msg(ele, status, msg) {
        //清除原有状态
        $(ele).parent().removeClass("has-success has-error");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //保存员工
    $("#emp_save_btn").click(function () {
        //模态框表单数据交给服务器保存
        //先对要提交给服务器的数据进行校验
        if (!validate_add_form()) {
            return false;
        }
        //判断用户名是否检验成功
        if ($(this).attr("ajax-va") == "error") {
            return false;
        }
        //发送ajax请求保存员工
        $.ajax({
            url: "${APP_PATH}/emp",
            type: "post",
            data: $("#emp_add_modal form").serialize(),
            success: function (result) {
                // alert(result.msg);
                if (result.code == 100) {
                    //隐藏模态框
                    $('#emp_add_modal').modal('hide');
                    to_page(totalRecord);
                } else {
                    // console.log(result);
                    // alert(result.extend.errorFields.empName);
                    // alert(result.extend.errorFields.email);
                    if (undefined != result.extend.errorFields.empName) {
                        show_validate_msg("#empName_add", "error", result.extend.errorFields.empName);
                    }
                    if (undefined != result.extend.errorFields.email) {
                        show_validate_msg("#email_add", "error", result.extend.errorFields.email);
                    }
                }
            }
        });
    });

    $("#empName_add").change(function () {
        //发送ajax请求检验用户名是否可用
        var empName = this.value;
        $.ajax({
            url: "${APP_PATH}/checkUser",
            data: "empName=" + empName,
            type: "post",
            success: function (result) {
                if (result.code == 100) {
                    show_validate_msg("#empName_add", "success", "");
                    $("#emp_save_btn").attr("ajax-va", "success");
                } else if (result.code == 200) {
                    show_validate_msg("#empName_add", "error", result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va", "error");
                }
            }
        });
    });

    $(document).on("click", ".edit_btn", function () {
        //完全重置
        reset_form("#emp_update_modal form");
        // alert("edit");
        getDepts("#emp_update_modal select");
        getEmp($(this).attr("edit-id"));
        $("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
        $('#emp_update_modal').modal({
            backdrop: "static"
        });
    });

    function getEmp(id) {
        $.ajax({
            url: "${APP_PATH}/emp/" + id,
            type: "get",
            success: function (result) {
                // console.log(result);
                var empData = result.extend.emp;
                $("#empName_update").text(empData.empName);
                $("#email_update").val(empData.email);
                $("#emp_update_modal input[name=gender]").val([empData.gender]);
                $("#emp_update_modal select").val([empData.dId]);
            }
        });
    }

    //更新点击事件
    $("#emp_update_btn").click(function () {
        //验证邮箱格式
        var email = $("#email_update").val();
        var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            // alert("邮箱格式不正确");
            show_validate_msg("#email_update", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validate_msg("#email_update", "success", "");
        }
        $.ajax({
            url: "${APP_PATH}/emp/" + $(this).attr("edit-id"),
            type: "put",
            data: $("#emp_update_modal form").serialize(),
            success: function (result) {
                // alert(result.msg);
                $("#emp_update_modal").modal("hide");
                to_page(currentPage);
            }
        });
    });

    $(document).on("click", ".del_btn", function () {
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        // alert(empName);
        var empId = $(this).attr("del-id");
        if (confirm("确认删除【" + empName + "】吗？")) {
            $.ajax({
                url: "${APP_PATH}/emp/" + empId,
                type: "delete",
                success: function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    })

    $("#check_all").click(function () {
        $(".check_item").prop("checked", $(this).prop("checked"));
    })

    $(document).on("click", ".check_item", function () {
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    })

    $("#del_all_btn").click(function () {
        var empNames = "";
        var del_ids = "";
        $.each($(".check_item:checked"), function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            del_ids += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        empNames = empNames.substring(0, empNames.length - 1);
        del_ids = del_ids.substring(0, del_ids.length - 1);
        if (confirm("确认删除" + empNames + "吗？")) {
            $.ajax({
                url: "${APP_PATH}/emp/" + del_ids,
                type: "delete",
                success: function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    })
</script>
</body>
</html>
