<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title><dec:title default="Trang chủ" /></title>

    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="font-awesome/4.5.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
    <script type='text/javascript' src="assets/js/ace-extra.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!-- jquery -->
    <script type='text/javascript' src="js/2.1.4/jquery.min.js"></script>

    <%--sweetalert--%>
    <script type='text/javascript' src="assets/sweetalert2/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="assets/sweetalert2/sweetalert2.min.css">
</head>
<body class="no-skin">
<!-- header -->
<%@ include file="/common/admin/header.jsp" %>
<!-- header -->

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>
    <!-- header -->
    <%@ include file="/common/admin/menu.jsp" %>
    <!-- header -->

    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Trang chủ</a>
                    </li>
                    <li class="active">Đổi mật khẩu</li>
                </ul><!-- /.breadcrumb -->
            </div>
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <c:if test="${not empty messageResponse}">
                            <div class="alert alert-block alert-${alert}">
                                <button type="button" class="close" data-dismiss="alert">
                                    <i class="ace-icon fa fa-times"></i>
                                </button>
                                    ${messageResponse}
                            </div>
                        </c:if>
                        <div id="profile">
                            <form:form id="formChangePassword" class="form-horizontal" name="formChangePassword">
                                <div class="space-4"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">
                                            <%--<spring:message code="label.password.old"/>--%>
                                        Mật khẩu cũ
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" id="oldPassword" name="oldPassword"/>
                                    </div>
                                </div>
                                <div class="space-4"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">
                                            <%--<spring:message code="label.password.new"/>--%>
                                        Mật khẩu mới
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" id="newPassword" name="newPassword"/>
                                    </div>
                                </div>
                                <div class="space-4"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">
                                            <%--<spring:message code="label.password.repeat"/>--%>
                                        Nhập lại mật khẩu mới
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"/>
                                    </div>
                                </div>
                                <!--Btn-->
                                <div class="col-sm-12">
                                    <label class="col-sm-3 control-label no-padding-right message-info"></label>
                                    <input type="button" class="btn btn-white btn-warning btn-bold" value="Đổi mật khẩu" id="btnChangePassword"/>
                                </div>
                                <!--Btn-->
                                <input type="hidden" value="${model.id}" id="userId"/>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#btnChangePassword').click(function () {
                    $('#formChangePassword').submit();
                });
            });
            $(function() {
                $("form[name='formChangePassword']").validate({
                    rules: {
                        oldPassword: "required",
                        newPassword: {
                            required: true,
                            minlength: 6
                        },
                        confirmPassword: "required"
                    },
                    messages: {
                        oldPassword: "Không bỏ trống",
                        newPassword: {
                            required: "Không bỏ trống",
                            minlength: "Mật khẩu tối thiểu 6 kí tự"
                        },
                        confirmPassword: "Không bỏ trống"
                    },
                    submitHandler: function(form) {
                        var formData = $('#formChangePassword').serializeArray();
                        var dataArray = {};
                        $.each(formData, function (i, v) {
                            dataArray["" + v.name + ""] = v.value;
                        });
                        changePassword(dataArray, $('#userId').val());
                    }
                });
            });

            function changePassword(data, id) {
                $.ajax({
                    url: '${changePasswordURL}/'+id,
                    type: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    success: function (res) {
                        if (res == 'update_success') {
                            window.location.href = "<c:url value='/admin/profile-password?message=update_success'/>";
                        } else if (res == 'change_password_fail') {
                            window.location.href = "<c:url value='/admin/profile-password?message=change_password_fail'/>";
                        }
                    },
                    error: function (res) {
                        console.log(res);
                        window.location.href = "<c:url value='/admin/profile-password?message=error_system'/>";
                    }
                });
            }
        </script>
    </div>

    <!-- footer -->
    <%@ include file="/common/admin/footer.jsp" %>
    <!-- footer -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse display">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div>

<%--jQuery Validation Plugin--%>
<script src="js/jqueryvalidate/jquery.validate.min.js"></script>

<%--common javascript file--%>
<script type="text/javascript" src="js/global_admin_script.js"></script>

<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery-ui.custom.min.js"></script>
<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="assets/js/jquery.easypiechart.min.js"></script>
<script src="assets/js/jquery.sparkline.min.js"></script>
<script src="assets/js/jquery.flot.min.js"></script>
<script src="assets/js/jquery.flot.pie.min.js"></script>
<script src="assets/js/jquery.flot.resize.min.js"></script>
<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>

<!-- page specific plugin scripts -->
<script src="assets/js/jquery-ui.min.js"></script>

<script type="text/javascript">
    function showAlertBeforeDelete(callback) {
        swal({
            title: "Xác nhận xóa",
            text: "Bạn có chắc chắn xóa những dòng đã chọn",
            type: "warning",
            showCancelButton: true,
            confirmButtonText: "Xác nhận",
            cancelButtonText: "Hủy bỏ",
            confirmButtonClass: "btn btn-success",
            cancelButtonClass: "btn btn-danger"
        }).then(function (res) {
            if(res.value){
                callback();
            }else if(res.dismiss == 'cancel'){
                console.log('cancel');
            }
        });
    }
</script>
</body>
</html>