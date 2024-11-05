package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {
    @Autowired
    private RentAreaConverter rentAreaConverter;

    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse convertToSearchResponseDTO(BuildingEntity ele) {
        BuildingSearchResponse new_building = modelMapper.map(ele, BuildingSearchResponse.class);

        new_building.setAddress(ele.getStreet() + ", " + ele.getWard() + ", " + districtCode.type().get(ele.getDistrict()) );

        new_building.setRentArea( ele.getRentAreaEntities().stream().
                map(x -> x.getValue().toString() ).collect(Collectors.joining(", ")) );

        return new_building;
    }

    public BuildingDTO convertToDTO(BuildingEntity ele) {
        BuildingDTO new_building = modelMapper.map(ele, BuildingDTO.class);

        new_building.setImage(ele.getAvatar());

        new_building.setTypeCode(Arrays.asList(ele.getType().split(",")));

        new_building.setRentArea( ele.getRentAreaEntities().stream().
                map(x -> x.getValue().toString() ).collect(Collectors.joining(",")) );

        return new_building;
    }

    public BuildingEntity convertToEntity(BuildingDTO dto, BuildingEntity oldBuilding) {
        BuildingEntity newBuilding = modelMapper.map(dto, BuildingEntity.class);

        newBuilding.setType(String.join(",", dto.getTypeCode()));
        newBuilding.setStaffs(oldBuilding.getStaffs());
        newBuilding.setRentAreaEntities(rentAreaConverter.rentArea(dto, newBuilding));

        if( dto.getImageBase64() == null ) newBuilding.setAvatar(oldBuilding.getAvatar());

        return newBuilding;
    }
}
