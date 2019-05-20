package com.zking.crm.sale.mapper;

import com.zking.crm.sale.model.SalPlan;

import java.util.List;

public interface SalPlanMapper {
    int deleteByPrimaryKey(Integer plaId);

    int insert(SalPlan record);

    int insertSelective(SalPlan record);

    SalPlan selectByPrimaryKey(SalPlan record);

    int updateByPrimaryKeySelective(SalPlan record);

    int updateByPrimaryKey(SalPlan record);

    List<SalPlan> listSalPlan(SalPlan salPlan);
}