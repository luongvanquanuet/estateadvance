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
                    <li class="active">Chỉnh sửa người dùng</li>
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
                            <form:form id="formEdit" class="form-horizontal" commandName="model">
                                <div class="space-4"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">
                                            <%--<spring:message code="label.username"/>--%>
                                        Tên đăng nhập
                                    </label>
                                    <div class="col-sm-9">
                                        <form:input path="userName" id="userName" cssClass="form-control" disabled="true"/>
                                    </div>
                                </div>
                                <div class="space-4"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">
                                            <%--<spring:message code="label.fullname"/>--%>
                                        Tên đầy đủ
                                    </label>
                                    <div class="col-sm-9">
                                        <form:input path="fullName" id="fullName" cssClass="form-control"/>
                                    </div>
                                </div>
                                <!--Btn-->
                                <div class="col-sm-12">
                                    <label class="col-sm-3 control-label no-padding-right message-info"></label>
                                    <input type="button" class="btn btn-white btn-warning btn-bold"
                                           value="Cập nhật người dùng" id="btnUpdateUser"/>
                                </div>
                                <!--Btn-->
                                <form:hidden path="id" id="userId"/>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $("#btnUpdateUser").click(function (event) {
                event.preventDefault();
                var dataArray = {};
                dataArray["fullName"] = $('#fullName').val();
                if ($('#userId').val() != "") {
                    updateInfo(dataArray, $('#userName').val());
                }
            });

            function updateInfo(data, username) {
                $.ajax({
                    url: '${formUrl}/profile/' + username,
                    type: 'PUT',
                    dataType: 'json',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    success: function (res) {
                        window.location.href = "<c:url value='/admin/profile/"+res.userName+"?message=update_success'/>";
                    },
                    error: function (res) {
                        console.log(res);
                        window.location.href = "<c:url value='/admin/profile/"+username+"?message=error_system'/>";
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