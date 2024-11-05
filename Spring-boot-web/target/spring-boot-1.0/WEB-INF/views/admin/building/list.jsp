<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/10/2024
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="formUrl" value="/admin/building-list"/>
<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">

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
                    Dashboard
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->

            <!--Chia phần nội dung thành 12 cột-->
            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box">
                        <!--Phần viền của nội dung-->
                        <div class="widget-header">
                            <h4 class="widget-title">Tìm kiếm tòa nhà</h4>

                            <span class="widget-toolbar">
                                              <a href="#" data-action="reload">
                                                  <i class="ace-icon fa fa-refresh"></i>
                                              </a>

                                              <a href="#" data-action="collapse">
                                                  <i class="ace-icon fa fa-chevron-up"></i>
                                              </a>

                                              <a href="#" data-action="close">
                                                  <i class="ace-icon fa fa-times"></i>
                                              </a>
                                          </span>
                        </div>

                        <!--Phần nội dung-->
                        <div class="widget-body">
                            <div class="widget-main">
                                <div class="row">
                                    <!--Form tìm kiếm-->
                                    <form:form id="listForm" modelAttribute="modelSearch" action="${formUrl}"
                                               method="get">

                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <!--Phần tìm kiếm theo "nameBuilding"-->
                                            <div class="col-xs-6">
                                                <div>
                                                    <label>Tên tòa nhà</label>
                                                    <form:input class="form-control"
                                                                placeholder="Gõ tên tòa nhà..." path="name"/>
                                                </div>
                                            </div>

                                            <!--Phần tìm kiếm theo "floorArea"-->
                                            <div class="col-xs-6">
                                                <div>
                                                    <label>Diện tích sàn</label>
                                                    <input type="number" name="floorArea"
                                                           class="form-control" value="${modelSearch.floorArea}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Hết dòng 1-->

                                    <!--Dòng 2-->
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <!--Phần tìm kiếm theo "districtId": khi chọn tên quận thì sẽ tìm theo id tương ứng của quận đó-->
                                            <div class="col-xs-2">
                                                <div>
                                                    <label>Quận</label>
                                                    <form:select path="district"
                                                                 class="form-control"> <!--Cái path này liên quan đến bên BuildingSearchRequest-->
                                                        <form:option value="" label="--Chọn quận--"/>
                                                        <form:options items="${district}"/>
                                                    </form:select>
                                                </div>
                                            </div>

                                            <!--Phần tìm kiếm theo "ward"-->
                                            <div class="col-xs-5">
                                                <div>
                                                    <label>Phường</label>
                                                    <form:input path="ward" class="form-control"/>
                                                </div>
                                            </div>

                                            <!--Phần tìm kiếm theo "street"-->
                                            <div class="col-xs-5">
                                                <div>
                                                    <label>Đường</label>
                                                    <form:input class="form-control" path="street"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Hết dòng 2-->

                                    <!--Dòng 3-->
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <!--Phần tìm kiếm theo "numberOfBasement"-->
                                            <div class="col-xs-4">
                                                <div>
                                                    <label>Số tầng hầm</label>
                                                    <input type="number" name="numberOfBasement"
                                                           class="form-control"
                                                           value="${modelSearch.numberOfBasement}">
                                                </div>
                                            </div>

                                            <!--Phần tìm kiếm theo "direction"-->
                                            <div class="col-xs-4">
                                                <div>
                                                    <label>Hướng</label>
                                                    <form:input path="direction" class="form-control"/>
                                                </div>
                                            </div>

                                            <!--Phần tìm kiếm theo "level"-->
                                            <div class="col-xs-4">
                                                <div>
                                                    <label>Hạng</label>
                                                    <form:input path="level" class="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Hết dòng 3-->

                                    <!--Dòng 4-->
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <!--Phần tìm kiếm theo "rentAreaFrom"-->
                                            <div class="col-xs-3">
                                                <div>
                                                    <label>Diện tích từ</label>
                                                    <input type="number" name="rentAreaFrom"
                                                           class="form-control" value="${modelSearch.rentAreaFrom}">
                                                </div>
                                            </div>

                                            <!--Phần tìm kiếm theo "rentAreaTo"-->
                                            <div class="col-xs-3">
                                                <div>
                                                    <label>Diện tích đến</label>
                                                    <input type="number" name="rentAreaTo"
                                                           class="form-control" value="${modelSearch.rentAreaTo}">
                                                </div>
                                            </div>

                                            <!--Phần tìm kiếm theo "rentPriceFrom"-->
                                            <div class="col-xs-3">
                                                <div>
                                                    <label>Giá tiền từ</label>
                                                    <input type="number" name="rentPriceFrom"
                                                           class="form-control"
                                                           value="${modelSearch.rentPriceFrom}">
                                                </div>
                                            </div>

                                            <!--Phần tìm kiếm theo "rentPriceTo"-->
                                            <div class="col-xs-3">
                                                <div>
                                                    <label>Giá tiền đến</label>
                                                    <input type="number" name="rentPriceTo"
                                                           class="form-control" value="${modelSearch.rentPriceTo}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Hết dòng 4-->

                                    <!--Dòng 5-->
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <!--Phần tìm kiếm theo "managerName"-->
                                            <div class="col-xs-4">
                                                <div>
                                                    <label>Tên quản lý</label>
                                                    <form:input path="managerName" class="form-control"/>
                                                </div>
                                            </div>

                                            <!--Phần tìm kiếm theo "managerPhone"-->
                                            <div class="col-xs-4">
                                                <div>
                                                    <label>SĐT Quản lý</label>
                                                    <form:input path="managerPhone" class="form-control"/>
                                                </div>
                                            </div>

                                            <!--Phần tìm kiếm theo "staffId" (Chọn tên nhân viên thì sẽ tìm theo id tương ứng của nhân viên đó)-->
                                            <div class="col-xs-4">
                                                <div>
                                                    <label>Nhân viên phụ trách</label>
                                                    <form:select path="staffId" class="form-control">
                                                        <form:option value="" label="--Chọn nhân viên"/>
                                                        <form:options items="${staffs}"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Hết dòng 5-->

                                    <!--Dòng 6-->
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-xs-4">
                                                    <%--                                                    <div>--%>
                                                    <%--                                                        <input type="checkbox" name="typeCode" value="tang-tret">--%>
                                                    <%--                                                        <label>Tầng trệt</label>--%>

                                                    <%--                                                        <input type="checkbox" name="typeCode" value="nguyen-can">--%>
                                                    <%--                                                        <label>Nguyên căn</label>--%>

                                                    <%--                                                        <input type="checkbox" name="typeCode" value="noi-that">--%>
                                                    <%--                                                        <label>Nội thất</label>--%>
                                                    <%--                                                    </div>--%>
                                                <form:checkboxes items="${rentType}" path="typeCode"/>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Hết dòng 6-->

                                    <!--Dòng 7-->
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <!--Nút tìm kiếm-->
                                            <div class="col-xs-2">
                                                <button type="button" class="btn btn-sm btn-primary"
                                                        id="btnSearchBuilding">
                                                    <i class="ace-icon glyphicon glyphicon-search"></i>
                                                    Tìm kiếm
                                                </button>
                                            </div>

                                            <!--Nút xóa (reset hết các field tìm kiếm)-->
                                            <div class="col-xs-2">
                                                <a href="${formUrl}">
                                                    <button type="button" class="btn btn-sm btn-primary">Xóa
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Hết dòng 7-->

                                </div>
                            </div>
                        </div>

                        </form:form>

                        <!--2 nút dưới thông tin tìm kiếm-->
                        <div class="pull-right">
                            <!--"title" hiển thị thông tin của nút (tác dụng hay cái gì đấy)-->
                            <a href="/admin/building-edit">
                                <button class="btn btn-app btn-primary btn-sm" title="Thêm tòa nhà">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                         fill="currentColor" class="bi bi-building-fill-add" viewBox="0 0 16 16">
                                        <path
                                                d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                        <path
                                                d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                            </a>

                            <button class="btn btn-app btn-danger btn-sm" title="Xóa tòa nhà" id="btnDeleteBuilding">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                     fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                    <path
                                            d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                    <path
                                            d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                    <path
                                            d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hr hr-25 dotted hr-double"></div>

            <!--Bảng hiển thị kết quả-->
            <div class="row">
                <div class="col-xs-12">
                    <display:table name="buildingSearchResult.listResult" cellspacing="0"
                                   cellpadding="0"
                                   requestURI="${formUrl}" partialList="true"
                                   sort="external"
                                   size="${buildingSearchResult.totalItems}" defaultsort="2"
                                   defaultorder="ascending"
                                   id="tableList" pagesize="${buildingSearchResult.maxPageItems}"
                                   export="false"
                                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                   style="margin: 3em 0 1.5em;">
                        <display:column title="<fieldset class='form-group'>
                        												        <input type='checkbox' id='checkAll' class='check-box-element'>
                        												        </fieldset>" class="center select-cell"
                                        headerClass="center select-cell">
                            <fieldset>
                                <input type="checkbox" name="checkList"
                                       value="${tableList.id}"
                                       class="check-box-element"/>
                            </fieldset>
                        </display:column>
                        <display:column headerClass="text-left" property="name"
                                        title="Tên tòa nhà"/>
                        <display:column headerClass="text-left" property="address"
                                        title="Địa chỉ"/>
                        <display:column headerClass="text-left" property="numberOfBasement"
                                        title="Số tầng hầm"/>
                        <display:column headerClass="text-left" property="managerName"
                                        title="Tên quản lý"/>
                        <display:column headerClass="text-left"
                                        property="managerPhoneNumber" title="SĐT Quản lý"/>
                        <display:column headerClass="text-left" property="floorArea"
                                        title="Diện tích sàn"/>
                        <display:column headerClass="text-left" property="emptyArea"
                                        title="Diện tích trống"/>
                        <display:column headerClass="text-left" property="rentArea"
                                        title="Diện tích thuê"/>
                        <display:column headerClass="text-left" property="rentPrice"
                                        title="Giá thuê"/>
                        <display:column headerClass="text-left" property="serviceFee"
                                        title="Phí dịch vụ"/>
                        <display:column headerClass="text-left" property="brokerageFee"
                                        title="Phí môi giới"/>

                        <display:column headerClass="col-actions" title="Thao tác">
                            <button type="button" class="btn btn-xs btn-success"
                                    title="Giao tòa nhà"
                                    onclick="assignmentBuilding(${tableList.id})">
                                <i class="ace-icon fa fa-check bigger-120"></i>
                            </button>

                            <a href="/admin/building-edit-${tableList.id}">
                                <button type="button" class="btn btn-xs btn-info"
                                        title="Sửa tòa nhà">
                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                </button>
                            </a>

                            <button type="button" class="btn btn-xs btn-danger"
                                    title="Xóa tòa nhà"
                                    onclick="deleteBuilding(${tableList.id})">
                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                            </button>
                        </display:column>
                    </display:table>

                </div><!-- /.span -->
            </div>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
</a>

<!--Modal fade: Màn hình phụ hiển thị khi ấn nút nào đó-->
<div class="modal fade" id="assignmentBuildingModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Danh sách nhân viên</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table id="staffsList" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>Chọn</th>
                        <th>Tên nhân viên</th>
                    </tr>
                    </thead>

                    <tbody>

                    </tbody>
                </table>
                <!--Gửi id để giao tòa nhà cho nhân viên quản lý-->
                <input type="hidden" id="buildingId"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnAssignmentBuilding">Giao tòa nhà</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<script>
    /*
    --------------------------------------------------- Tìm kiếm tòa nhà ---------------------------------------------------
     */
    // Nút tìm kiếm
    $('#btnSearchBuilding').click(function(e) {
        e.preventDefault();

        // Đẩy các tham số trong các ô lên URL, và gán chúng cho cái đối tượng để hứng (ModelAttribute)
        $('#listForm').submit();
    });

    /*
    --------------------------------------------------- Xóa tòa nhà ---------------------------------------------------
     */
    // Xóa tất cả tòa được đánh dấu
    $('#btnDeleteBuilding').click(function(e) {
        // Ngăn các thao tác mặc định của trình duyệt (Xóa dữ liệu trong checkbox, option...)
        e.preventDefault();

        var buildingIds = $('#tableList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();

        console.log(buildingIds);

        // Kiểm tra xem đã chọn tòa nhà nào chưa
        if (buildingIds.length == 0) {
            alert("Chưa chọn tòa nhà cần xóa!");
        } else {
            if (confirm("Bạn chắc chắn muốn xóa các tòa nhà được đánh dấu chứ?")) {
                btnDeleteBuilding(buildingIds);
            }
        }
    });

    // Xóa 1 tòa nhà (bấm cái nút 'x' nhỏ ở cột 'Thao tác')
    function deleteBuilding(buildingId) {
        if (confirm("Bạn chắc chắn muốn xóa các tòa nhà này chứ?")) {
            btnDeleteBuilding(buildingId);
        }
    }

    // Gửi thông tin 1 hoặc các tòa nhà bị xóa về phía server
    function btnDeleteBuilding(data) {
        $.ajax({
            url: "/api/buildings" + "/" + data,
            type: "DELETE",
            dataType: "JSON",   // Kiểu dữ liệu để gửi cho client, bên Controller cũng phải trả ra đúng kiểu dữ liệu này
            success: function (result) {
                console.log(result);
                alert(result.message);
                location.reload();
            },
            error: function (result) {
                console.log(result);
                alert("Xóa thất bại!");
            }
        });
    }

    /*
    --------------------------------------------------- Giao tòa nhà cho nhân viên quản lý ---------------------------------------------------
     */
    // Hiện bảng các nhân viên đang quản lý tòa nhà có id này
    function assignmentBuilding(buildingId) {
        // .modal() chính là gọi cái data-dismiss của modal fade đã xây dựng
        $("#assignmentBuildingModal").modal();

        // Gán cái id (vừa gửi xuống để lấy danh sách nhân viên)
        $('#buildingId').val(buildingId);

        loadStaffs(buildingId);
    }

    // Lấy ra các nhân viên đang quản lý tòa nhà có id = buildingId
    function loadStaffs(buildingId) {
        $.ajax({
            url: "/api/buildings" + "/" + buildingId,
            type: "GET",
            // data: JSON.stringify(json),
            contentType: "application/json",
            dataType: "JSON",
            success: function (result) {
                alert(result.message);

                var row = '';

                $.each(result.data, function (index, item) {
                    row += '<tr>';
                    row += '<td> <input type=checkbox value=' + item.staffId + ' id="checkbox_' + item.staffId + '" ' + item.checked + '/> </td>';
                    row += '<td>' + item.userName + '</td>';
                    row += '</tr>';
                });

                // Hiển thị danh sách đã format, cái staffsList là biến chỉ đến tbody trong modal fade
                $('#staffsList tbody').html(row);
            },
            error: function (result) {
                console.log("Lấy thất bại!");
                alert(result.messages);
            }
        });
    }

    $('#btnAssignmentBuilding').click(function (e) {
        e.preventDefault();

        var json = {};

        json['id'] = $('#buildingId').val();

        json['staffs'] = $('#staffsList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();

        console.log(json);

        if (confirm("Bạn chắc chắn muốn cập nhật giao tòa nhà?")) {
            updateAssignmentBuilding(json);
        }
    });

    // Gửi dữ liệu để cập nhật xuống server
    function updateAssignmentBuilding(json) {
        $.ajax({
            url: "/api/buildings/staffs",
            type: "PUT",
            data: JSON.stringify(json),
            contentType: 'application/json',
            dataType: 'JSON',
            success: function (result) {
                console.log("Giao thành công!");
                alert(result.message);
            },
            error: function (result) {
                console.log("Giao thất bại!");
                alert(result.message);
            }
        });
    }

</script>
</body>
</html>
