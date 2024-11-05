package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.utils.StringUtils;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class RentAreaConverter {
    public List<RentAreaEntity> rentArea(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();

        // Xử lý rentArea của tòa nhà
        for (String it : buildingDTO.getRentArea().split(",")) {
            if (StringUtils.check(it)) {
                RentAreaEntity rentAreaEntity = new RentAreaEntity();

                rentAreaEntity.setValue(Integer.parseInt(it));
                rentAreaEntity.setBuildingEntity(buildingEntity);

                rentAreaEntities.add(rentAreaEntity);
            }
        }

        return rentAreaEntities;
    }
}
