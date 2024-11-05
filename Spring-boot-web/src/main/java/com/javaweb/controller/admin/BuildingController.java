package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.enums.buildingRentType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import com.javaweb.utils.MessageUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController(value = "buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private IUserService userService;

    @Autowired
    private IBuildingService buildingService;

    @Autowired
    private MessageUtils messageUtil;

    @GetMapping(value = "/admin/building-list") // ModelAndView ko cho truy xuất quá 3 bậc
    private ModelAndView buildingList(@ModelAttribute(name = "modelSearch") BuildingSearchRequest params, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("admin/building/list");

        modelAndView.addObject("district", districtCode.type()); // "QUAN_1", "Quận 1"
        modelAndView.addObject("staffs", userService.allStaff());
        modelAndView.addObject("rentType", buildingRentType.type()); // "NGUYEN_CAN", "Nguyên căn"

        BuildingSearchResponse buildingSearchResponse = new BuildingSearchResponse();

        DisplayTagUtils.of(request, buildingSearchResponse);
        buildingSearchResponse.setListResult( buildingService.findAll(params, PageRequest.of(buildingSearchResponse.getPage() - 1, buildingSearchResponse.getMaxPageItems()) ) );
        buildingSearchResponse.setTotalItems( buildingService.countTotalItems(params) );

        modelAndView.addObject("buildingSearchResult", buildingSearchResponse);

        return modelAndView;
    }

    // Hiển thị màn hình Thêm mới
    @GetMapping(value = "/admin/building-edit")
    private ModelAndView buildingEdit(@ModelAttribute(name = "buildingEdit") BuildingDTO params) {
        ModelAndView modelAndView = new ModelAndView("admin/building/edit");

        modelAndView.addObject("district", districtCode.type()); // "QUAN_1", "Quận 1"
        modelAndView.addObject("rentType", buildingRentType.type()); // "NGUYEN_CAN", "Nguyên căn"

        return modelAndView;
    }

    // Hiển thị màn hình Cập nhật
    @GetMapping(value = "/admin/building-edit-{id}")
    private ModelAndView buildingEdit(@ModelAttribute(name = "buildingEdit") BuildingDTO buildingDTO, @PathVariable Long id) {
        ModelAndView modelAndView = new ModelAndView("admin/building/edit");

        modelAndView.addObject("district", districtCode.type()); // "QUAN_1", "Quận 1"
        modelAndView.addObject("rentType", buildingRentType.type()); // "NGUYEN_CAN", "Nguyên căn"
        modelAndView.addObject("buildingEdit", buildingService.findOneBuildingById(id));

        return modelAndView;
    }

    private void initMessageResponse(ModelAndView mav, HttpServletRequest request) {
        String message = request.getParameter("message");

        if (message != null && StringUtils.isNotEmpty(message)) {
            Map<String, String> messageMap = messageUtil.getMessage(message);
            mav.addObject(SystemConstant.ALERT, messageMap.get(SystemConstant.ALERT));
            mav.addObject(SystemConstant.MESSAGE_RESPONSE, messageMap.get(SystemConstant.MESSAGE_RESPONSE));
        }
    }
}
