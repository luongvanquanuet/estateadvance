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
    <%--<decorator:body/>--%>
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
                    <li class="active">Chi tiết building</li>
                </ul><!-- /.breadcrumb -->


            </div>

            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <form:form commandName="modelBuilding" cssClass="form-horizontal" role="form" id="formEdit">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    Tên toà nhà</label>
                                <div class="col-sm-9">
                                    <form:input path="name" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    Đường</label>
                                <div class="col-sm-9">
                                    <form:input path="street" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    Phường</label>

                                <div class="col-sm-9">
                                    <form:input path="ward" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    Quận</label>

                                <div class="col-sm-9">
                                    <select class="form-control" id="sel1" name="district">
                                        <option selected disabled>Chọn Quận</option>
                                        <c:forEach var="item" items="${modelDistrict}">
                                            <option ${item.selected} value="${item.code}">${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    Hướng</label>

                                <div class="col-sm-9">
                                    <form:input path="direction" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    Hạng</label>

                                <div class="col-sm-9">
                                    <form:input path="level" cssClass="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    Cấu trúc</label>

                                <div class="col-sm-9">
                                    <form:input path="structure" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    Số tầng hầm</label>

                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="numberOfBasement"
                                           value="${modelBuilding.numberOfBasement}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    Diện tích sàn</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="floorArea"
                                           value="${modelBuilding.floorArea}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                >
                                    Giá thuê</label>
                                <div class="col-sm-9">
                                    <form:input path="rentPrice" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                >
                                    Chú thích giá thuê</label>
                                <div class="col-sm-9">
                                    <form:input path="rentPriceDescription" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                >
                                    Phí dịch vụ</label>
                                <div class="col-sm-9">
                                    <form:input path="serviceFee" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                >
                                    Diện tích thuê</label>
                                <div class="col-sm-9">
                                    <form:input path="rentArea" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                >
                                    Phí ô tô</label>
                                <div class="col-sm-9">
                                    <form:input path="carFee" cssClass="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                >
                                    Phí mô tô</label>
                                <div class="col-sm-9">
                                    <form:input path="motoFee" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                >
                                    Phí ngoài giờ</label>
                                <div class="col-sm-9">
                                    <form:input path="overTimeFee" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                >
                                    Phí nước</label>
                                <div class="col-sm-9">
                                    <form:input path="waterFee" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                >
                                    Phí điện</label>
                                <div class="col-sm-9">
                                    <form:input path="electricityFee" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                >
                                    Tiền Cọc</label>
                                <div class="col-sm-9">
                                    <form:input path="deposit" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                >
                                    Payment</label>
                                <div class="col-sm-9">
                                    <form:input path="payment" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                >
                                    Thời gian thuê</label>
                                <div class="col-sm-9">
                                    <form:input path="rentTime" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                       name="numberOfBasement">
                                    Thời gian dercor</label>
                                <div class="col-sm-9">
                                    <form:input path="decorationTime" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    Tên quản lí</label>

                                <div class="col-sm-9">
                                    <form:input path="managerName" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    Số điện thoại quản lí</label>

                                <div class="col-sm-9">
                                    <form:input path="managerPhone" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    Loại toà nhà</label>

                                <div class="col-sm-9">
                                    <c:forEach var="item" items="${modelBuildingType}">
                                        <input class="form-check-input" name="type" type="checkbox"
                                            ${item.checked} value="${item.code}">
                                        <label class="form-check-label">
                                                ${item.name}
                                        </label>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                </label>
                                <div class="col-sm-9">
                                    <c:if test="${modelBuilding.id==null}">
                                        <button type="button" class="btn btn-primary" id="btnAddBuilding">Thêm toà
                                            nhà
                                        </button>
                                    </c:if>
                                    <c:if test="${modelBuilding.id!=null}">
                                        <button type="button" class="btn btn-primary" id="btnAddBuilding">Update toà nhà
                                        </button>
                                    </c:if>

                                    <button type="button" class="btn btn-primary">Huỷ</button>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
    <script>
        $('#btnAddBuilding').click(function (e) {
            e.preventDefault();
            let data = {}
            let formData = $('#formEdit').serializeArray();
            let id = ${modelBuilding.id}+'';
            if ((id) != '') {
                data["id"] = id;
            }
            let buildingTypes = [];
            formData.forEach(item => {
                if (item.name == "type") {
                    buildingTypes.push(item.value);
                }
                data[item.name] = item.value
            })
            data["type"] = buildingTypes;
            $.ajax({
                type: "post",
                url: '<c:url value="/api/building"/>',
                data: JSON.stringify(data),
                dataType: "json",//kieu du lieu tu server tra ve client
                contentType: "application/json",//kieu du lieu tu client gui ve server
                success: function (response) {
                    window.location.href = '<c:url value="/admin/building-list" />'
                },
                error: function (response) {
                    alert("fail")
                    console.log(response)
                }
            });
        })
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<%--<dec:body/>--%>
    <%--
            cac con thay doi body theo trang do
    --%>

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