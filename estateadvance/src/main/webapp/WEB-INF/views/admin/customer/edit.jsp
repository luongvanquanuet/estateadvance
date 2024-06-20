<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<%--
decorator chua cac trang lon nhat
--%>
<!DOCTYPE html>
<html>
<head>
    <title><decorator:title default="Trang chủ quan" /></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/bootstrap.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/template/admin/font-awesome/4.5.0/css/font-awesome.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/ace.min.css' />" class="ace-main-stylesheet" id="main-ace-style" />
    <script src="<c:url value='/template/admin/assets/js/ace-extra.min.js' />"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type='text/javascript' src='<c:url value="/template/admin/js/jquery-2.2.3.min.js" />'></script>
    <script src="<c:url value='/template/admin/assets/js/jquery.2.1.1.min.js' />"></script>

    <%--....--%>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
    <decorator:body/>
    <%--<dec:body/>--%>
    <%--
            cac con thay doi body theo trang do
    --%>
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
                        <a href="<c:url value="/admin/home"/> ">Trang chủ</a>
                    </li>
                    <li class="active">Chi tiết Khách Hàng</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <form:form commandName="customer" cssClass="form-horizontal" role="form" id="formEdit">
                            <div class="form-group">
                                <label class="col-sm-3">
                                    Tên Đầy Đủ</label>
                                <div class="col-sm-9">
                                    <form:input path="fullName" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3">
                                    Số Điện Thoại</label>
                                <div class="col-sm-9">
                                    <form:input path="phone" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3">
                                    Email</label>
                                <div class="col-sm-9">
                                    <form:input path="email" cssClass="form-control"/>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                </label>
                                <div class="col-sm-9">
                                    <c:if test="${customer.id==null}">
                                        <button type="button" class="btn btn-primary" id="btnAddBuilding">Thêm Khách Hàng
                                        </button>
                                    </c:if>
                                    <c:if test="${customer.id!=null}">
                                        <button type="button" class="btn btn-primary" id="btnAddBuilding">Update Khách Hàng
                                        </button>
                                    </c:if>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-12">
                        <c:forEach var="item" items="${customer.transactionResponseList}">
                            <div class="row">
                                <div class="row">
                                    <div class="col-md-2">
                                        <h5 style="color: darkred">${item.typeValue}</h5>
                                    </div>
                                    <div class="col-md-10">
                                        <button class="btn btn-white btn-info btn-bold " data-toggle="tooltip"
                                                title="Thêm Giao Dịch"
                                                value="${item.code}" onclick="saveTran(value)">
                                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Ngày Tạo</th>
                                                <th>Ghi Chú</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item2" items="${item.transaction}">
                                                <tr>
                                                    <td>${item2.createDateStr}</td>
                                                    <td>${item2.note}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <td></td>
                                                <td><input type="text" id="node${item.code}" class="form-control"></td>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
    <script>
        $("#btnAddBuilding").click(function (e){
            e.preventDefault()
            save();
        })
        function saveTran(value){
            let data={
                "code":value,
                "note":$("#node"+value).val(),
                "customerId":"${customer.id}"
            }
            $.ajax({
                url:"<c:url value="/api/transaction"/> ",
                type: "post",
                data:JSON.stringify(data),
                datatype:"json",
                contentType: "application/json",
                success:function (){
                    window.location.reload()
                },
                error:function (){
                    alert("error")
                }
            })
        }
        function save(){
            let data = {}
            let formData = $('#formEdit').serializeArray();
            let id = ${customer.id}+'';
            if (id != '') {
                data["id"] = id;
            }
            formData.forEach(item => {
                data[item.name] = item.value
            })
            $.ajax({
                type: "post",
                url: '<c:url value="/api/customer"/>',
                data: JSON.stringify(data),
                dataType: "json",//kieu du lieu tu server tra ve client
                contentType: "application/json",//kieu du lieu tu client gui ve server
                success: function (response) {
                    window.location.href = '<c:url value="/admin/customer-list" />'
                },
                error: function (response) {
                    alert("fail")
                    console.log(response)
                }
            });
        }
    </script>
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

<script src="<c:url value='/template/admin/assets/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/template/admin/assets/js/jquery-ui.custom.min.js' />"></script>
<script src="<c:url value='/template/admin/assets/js/jquery.ui.touch-punch.min.js' />"></script>
<script src="<c:url value='/template/admin/assets/js/jquery.easypiechart.min.js' />"></script>
<script src="<c:url value='/template/admin/assets/js/jquery.sparkline.min.js' />"></script>
<script src="<c:url value='/template/admin/assets/js/jquery.flot.min.js' />"></script>
<script src="<c:url value='/template/admin/assets/js/jquery.flot.pie.min.js' />"></script>
<script src="<c:url value='/template/admin/assets/js/jquery.flot.resize.min.js' />"></script>
<script src="<c:url value='/template/admin/assets/js/ace-elements.min.js' />"></script>
<script src="<c:url value='/template/admin/assets/js/ace.min.js' />"></script>
<script src="<c:url value='/template/admin/assets/js/bootstrap.min.js' />"></script>

<!-- page specific plugin scripts -->
<script src="<c:url value='/template/admin/assets/js/jquery-ui.min.js' />"></script>

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