package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    // Xử lí join bảng
    public void queryJoin(BuildingSearchRequest buildingSearchRequest, StringBuilder join) {
        Integer staffId = buildingSearchRequest.getStaffId();

        if (staffId != null)
            join.append(" INNER JOIN assignmentbuilding asmbld ON b.id = asmbld.buildingid");
    }

    public void queryWhereNormal(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        // Java Reflection
        try {
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();

            for(Field it : fields) {
                it.setAccessible(true);

                String key = it.getName();

                if (!key.equals("staffId") && !key.equals("typeCode") && !key.startsWith("rentArea") && !key.startsWith("rentPrice") ) {
                    Object value = it.get(buildingSearchRequest);

                    if( value != null && !value.equals("")) {
                        if( it.getType().getName().equals("java.lang.Long") || it.getType().getName().equals("java.lang.Integer") ) {
                            where.append(" AND b." + key.toLowerCase() + " = " + value);
                        }
                        else {
                            where.append(" AND b." + key.toLowerCase() + " LIKE '%" + value + "%'");
                        }
                    }
                }
            }
        }
        catch(Exception ex) {
            ex.printStackTrace();
        }
    }

    public void queryWhereSpecial(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        // StaffId
        Integer staffId = buildingSearchRequest.getStaffId();
        if (staffId != null)
            where.append(" AND asmbld.staffid = " + staffId);

        // rentAreaFrom, rentAreaTo
        Integer rentAreaFrom = buildingSearchRequest.getRentAreaFrom();
        Integer rentAreaTo = buildingSearchRequest.getRentAreaTo();
        if(rentAreaFrom != null || rentAreaTo != null) {
            where.append(" AND EXISTS (SELECT * FROM rentarea ra WHERE ra.buildingid = b.id");

            if (rentAreaFrom != null)
                where.append(" AND ra.value >= " + rentAreaFrom);

            if (rentAreaTo != null)
                where.append(" AND ra.value <= " + rentAreaTo);

            where.append(")");
        }

        // rentPriceFrom, rentPriceTo
        Integer rentPriceFrom = buildingSearchRequest.getRentPriceFrom();
        if (rentPriceFrom != null)
            where.append(" AND b.rentprice >= " + rentPriceFrom);

        Integer rentPriceTo = buildingSearchRequest.getRentPriceTo();
        if (rentPriceTo != null)
            where.append(" AND b.rentprice <= " + rentPriceTo);

        // Type
        List<String> typeCode = buildingSearchRequest.getTypeCode();
        if(typeCode != null && !typeCode.isEmpty()) {
            where.append(" AND " + typeCode.stream().map(x -> " b.type LIKE '%" + x + "%' ").collect(Collectors.joining(" OR ")) + " ");
        }
    }

    // ---------------------------------------------------------------------- Hàm xử lí chính
    @Override
    public List<BuildingEntity> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        // Câu lệnh sql
        StringBuilder sql = new StringBuilder(buildQueryFilter());
        StringBuilder join = new StringBuilder("");
        StringBuilder where = new StringBuilder(" WHERE 1=1");

        // Xây dựng các thành phần JOIN, WHERE
        queryJoin(buildingSearchRequest, join);
        queryWhereNormal(buildingSearchRequest, where);
        queryWhereSpecial(buildingSearchRequest, where);

        // Kết hợp các thành phần của câu query lại
        sql.append(join).append(where).append(" GROUP BY b.id").append(" LIMIT ").append(pageable.getPageSize())
                                                                .append(" OFFSET ").append(pageable.getOffset());

        // In ra câu query để check
        System.out.println(sql);

        // Kết nối với database để lấy dữ liệu
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);

        // Trả về các kết quả tìm được
        return query.getResultList();
    }

    @Override
    public int countTotalItems(BuildingSearchRequest buildingSearchRequest){
        StringBuilder sql = new StringBuilder(buildQueryFilter());
        StringBuilder join = new StringBuilder("");
        StringBuilder where = new StringBuilder(" WHERE 1=1");

        // Xây dựng các thành phần JOIN, WHERE
        queryJoin(buildingSearchRequest, join);
        queryWhereNormal(buildingSearchRequest, where);
        queryWhereSpecial(buildingSearchRequest, where);

        sql.append(join).append(where).append(" GROUP BY b.id");

        Query query = entityManager.createNativeQuery(sql.toString());

        return query.getResultList().size();
    }

    private String buildQueryFilter() {
        return "SELECT b.* FROM building b";
    }
}
