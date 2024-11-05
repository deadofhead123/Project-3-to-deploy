<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/10/2024
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Tùy chỉnh tòa nhà</title>
</head>
<body>
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
                    <a href="#">Home</a>
                </li>
                <li class="active">Dashboard</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">

            <div class="page-header">
                <h1>
                    Thông tin tòa nhà
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                    <form:form method="get" id="form-edit" modelAttribute="buildingEdit" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${buildingEdit.id}"/>
                        <!--name building-->
                        <div class="form-group">
                            <label class="col-xs-3">Tên tòa nhà</label>
                            <div class="col-xs-9">
                                <form:input path="name" class="form-control" placeholder="Gõ tên tòa nhà..."/>
                            </div>
                        </div>

                        <!--district id-->
                        <div class="form-group">
                            <label class="col-xs-3">Quận</label>
                            <div class="col-xs-3">
                                <form:select path="district"
                                             class="form-control"> <!--Cái path này liên quan đến bên BuildingSearchRequest-->
                                    <form:option value="" label="--Chọn quận--"/>
                                    <form:options items="${district}"/>
                                </form:select>
                            </div>
                        </div>

                        <!--ward-->
                        <div class="form-group">
                            <label class="col-xs-3">Phường</label>
                            <div class="col-xs-9">
                                <form:input path="ward" class="form-control"/>
                            </div>
                        </div>

                        <!--street-->
                        <div class="form-group">
                            <label class="col-xs-3">Đường</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="street"/>
                            </div>
                        </div>

                        <!--structure-->
                        <div class="form-group">
                            <label class="col-xs-3">Cấu trúc</label>
                            <div class="col-xs-9">
                                <form:input path="structure" class="form-control"/>
                            </div>
                        </div>

                        <!--number of basement-->
                        <div class="form-group">
                            <label class="col-xs-3">Số tầng hầm</label>
                            <div class="col-xs-9">
                                <form:input path="numberOfBasement" class="form-control"/>
                            </div>
                        </div>

                        <!--floor area-->
                        <div class="form-group">
                            <label class="col-xs-3">Diện tích sàn</label>
                            <div class="col-xs-9">
                                <form:input path="floorArea" class="form-control"/>
                            </div>
                        </div>

                        <!--type code-->
                        <div class="form-group">
                            <label class="col-xs-3">Loại tòa nhà</label>
                            <div class="col-xs-9">
                                <!--Để id giống nhau và type là radio thì sẽ chỉ đánh dấu được 1 cái-->
                                <form:checkboxes items="${rentType}" path="typeCode"/>
                            </div>
                        </div>

                        <!--direction-->
                        <div class="form-group">
                            <label class="col-xs-3">Hướng</label>
                            <div class="col-xs-9">
                                <form:input path="direction" class="form-control"/>
                            </div>
                        </div>

                        <!--level-->
                        <div class="form-group">
                            <label class="col-xs-3">Hạng</label>
                            <div class="col-xs-9">
                                <form:input path="level" class="form-control"/>
                            </div>
                        </div>

                        <!--rent area-->
                        <div class="form-group">
                            <label class="col-xs-3">Diện tích thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentArea" class="form-control"/>
                            </div>
                        </div>

                        <!--rent price-->
                        <div class="form-group">
                            <label class="col-xs-3">Giá thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentPrice" class="form-control"/>
                            </div>
                        </div>

                        <!--rent price description-->
                        <div class="form-group">
                            <label class="col-xs-3">Mô tả giá thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentPriceDescription" class="form-control"/>
                            </div>
                        </div>

                        <!--service fee-->
                        <div class="form-group">
                            <label class="col-xs-3">Phí dịch vụ</label>
                            <div class="col-xs-9">
                                <form:input path="serviceFee" class="form-control"/>
                            </div>
                        </div>

                        <!--car fee-->
                        <div class="form-group">
                            <label class="col-xs-3">Phí ô tô</label>
                            <div class="col-xs-9">
                                <form:input path="carFee" class="form-control"/>
                            </div>
                        </div>

                        <!--motorbike fee-->
                        <div class="form-group">
                            <label class="col-xs-3">Phí xe máy</label>
                            <div class="col-xs-9">
                                <form:input path="motorFee" class="form-control"/>
                            </div>
                        </div>

                        <!--overtime fee-->
                        <div class="form-group">
                            <label class="col-xs-3">Phí quá giờ</label>
                            <div class="col-xs-9">
                                <form:input path="overtimeFee" class="form-control"/>
                            </div>
                        </div>

                        <!--water fee-->
                        <div class="form-group">
                            <label class="col-xs-3">Tiền nước</label>
                            <div class="col-xs-9">
                                <form:input path="waterFee" class="form-control"/>
                            </div>
                        </div>

                        <!--electricity fee-->
                        <div class="form-group">
                            <label class="col-xs-3">Tiền điện</label>
                            <div class="col-xs-9">
                                <form:input path="electricityFee" class="form-control"/>
                            </div>
                        </div>

                        <!--deposit-->
                        <div class="form-group">
                            <label class="col-xs-3">Tiền đặt cọc</label>
                            <div class="col-xs-9">
                                <form:input path="deposit" class="form-control"/>
                            </div>
                        </div>

                        <!--payment-->
                        <div class="form-group">
                            <label class="col-xs-3">Tiền thanh toán</label>
                            <div class="col-xs-9">
                                <form:input path="payment" class="form-control"/>
                            </div>
                        </div>

                        <!--rent time-->
                        <div class="form-group">
                            <label class="col-xs-3">Thời gian thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentTime" class="form-control"/>
                            </div>
                        </div>

                        <!--decoration time-->
                        <div class="form-group">
                            <label class="col-xs-3">Thời gian trang trí</label>
                            <div class="col-xs-9">
                                <form:input path="decorationTime" class="form-control"/>
                            </div>
                        </div>

                        <!--brokerage fee-->
                        <div class="form-group">
                            <label class="col-xs-3">Phí môi giới</label>
                            <div class="col-xs-9">
                                <form:input path="brokerageFee" class="form-control"/>
                            </div>
                        </div>

                        <!--note-->
                        <div class="form-group">
                            <label class="col-xs-3">Ghi chú</label>
                            <div class="col-xs-9">
                                <form:input path="note" class="form-control"/>
                            </div>
                        </div>

                        <!--link of building-->
                        <div class="form-group">
                            <label class="col-xs-3">Liên kết tòa nhà</label>
                            <div class="col-xs-9">
                                <form:input path="buildingDTOs" class="form-control"/>
                            </div>
                        </div>

                        <!--map-->
                        <div class="form-group">
                            <label class="col-xs-3">Bản đồ</label>
                            <div class="col-xs-9">
                                <input type="text" name="map" id="map" class="form-control">
                            </div>
                        </div>

                        <!--image-->
                        <div class="form-group">
                            <label class="col-xs-3">Ảnh</label>
                            <div class="col-xs-9">
                                <input type="text" name="image" id="image" class="form-control">
                            </div>
                        </div>

                        <!--manager name-->
                        <div class="form-group">
                            <label class="col-xs-3">Tên quản lý</label>
                            <div class="col-xs-9">
                                <form:input path="managerName" class="form-control"/>
                            </div>
                        </div>

                        <!--manager phone number-->
                        <div class="form-group">
                            <label class="col-xs-3">SĐT quản lý</label>
                            <div class="col-xs-9">
                                <form:input path="managerPhoneNumber" class="form-control"/>
                            </div>
                        </div>

                        <!--avatar-->
                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Hình đại diện</label>
                            <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                            <div class="col-sm-9">
                                <!--Cũng giống cái nút Thêm và sửa thông tin, khi building chưa được tạo thì ko có ảnh, và nếu được tạo rồi thì có ảnh-->
                                <!--Hiện ảnh đại diện từ tòa nhà đã tồn tại-->
                                <c:if test="${not empty buildingEdit.image}">
                                    <c:set var="imagePath" value="/repository${buildingEdit.image}"/>
                                    <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="margin-top: 50px">
                                </c:if>

                                <!--Hiện ảnh đại diện mặc định-->
                                <c:if test="${empty buildingEdit.image}">
                                    Default:
                                    <img src="/admin/image/default.png" id="viewImage" width="300px" height="300px">
                                </c:if>
                            </div>
                        </div>

                        <!--Điều khiển-->
                        <div class="form-group">
                            <label class="col-xs-3"></label>
                            <div class="col-xs-9">
                                <c:if test="${empty buildingEdit.id}">
                                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Thêm tòa
                                        nhà
                                    </button>
                                </c:if>

                                <c:if test="${not empty buildingEdit.id}">
                                    <button type="button" class="btn btn-warning" id="btnAddOrUpdateBuilding">Sửa thông
                                        tin
                                    </button>
                                </c:if>

                                <button type="reset" class="btn btn-default">Xóa thông tin</button>

                                <a href="/admin/building-list">
                                    <!-- 1 cái button nằm trong form thì type mặc định của button sẽ theo type mặc định của form,
                                        nên phải đổi type của button để thực hiện chức năng khác-->
                                    <button type="button" class="btn btn-danger">Hủy thao tác</button>
                                </a>
                            </div>
                        </div>

                    </form:form>
                </div>
            </div>
            <div class="hr hr-25 dotted hr-double"></div>

        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
</a>

<script>
    var imageBase64 = '';
    var imageName = '';

    /*
    ------------------------------------------------- Thêm mới hoặc cập nhật thông tin tòa nhà -------------------------------------------------
     */
    $("#btnAddOrUpdateBuilding").click(function () {
        if (confirm("Xác nhận các thông tin chính xác?")) {
            var formData = $("#form-edit").serializeArray(); // serializeArray(): Khởi tạo 1 mảng chứa các object-->
            var json = {};
            var typeCode = [];

            // function(i, v): i là chỉ số, v là kiểu dữ liệu của phần tử tại chỉ số đó
            $.each(formData, function (i, v) {
                // Nhận đường dẫn hình ảnh
                if ('' !== imageBase64) {
                    json['imageBase64'] = imageBase64;
                    json['imageName'] = imageName;
                }

                // Nếu không lưu type code vào 1 mảng thì khi tích nhiều, sẽ chỉ lưu được 1 giá trị
                if (v.name == "typeCode") typeCode.push(v.value);
                else if (v.name == "buildingDTOs") v.value = [];
                else json["" + v.name + ""] = v.value; // json["'" + v.name + "'"] = v.value; là sai, còn sai như thế nào thì nháp ra giấy là hiểu
            });
            json['typeCode'] = typeCode;

            console.log(json);

            addOrUpdateBuilding(json);
        }
    });

    /*
    ----------- Upload ảnh -----------
     */

    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function (e) {
            imageBase64 = e.target.result;
            imageName = file.name; // Tên hình không dấu, khoảng trắng. Ví dụ: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });

    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' + imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    // Hàm cho nút "Thêm tòa nhà"
    // Hàm gửi dữ liệu xuống cho server
    function addOrUpdateBuilding(json) {
        $.ajax({
            url: "/api/buildings",
            type: "POST",
            data: JSON.stringify(json),
            contentType: 'application/json',
            dataType: 'JSON',
            success: function (result) {
                console.log(result);
                alert(result.message);

                // Thay đổi url để chuyển hướng tới url ta muốn
                location.replace("/admin/building-list");
            },
            error: function (result) {
                console.log(result);

                var row = "";

                $.each(result.responseJSON.details, function (index, item){
                    row += item + "\n";
                });

                alert(row);
            }
        });
    }
</script>
</body>
</html>
