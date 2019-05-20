package com.zking.crm.sale.service;

import com.zking.crm.sale.model.SalPlan;

import java.util.List;

/**
 * @author mi
 * @create 2019-05-19 18:16
 */
public interface ISalPlanService {
    int deleteByPrimaryKey(Integer plaId);

    int insert(SalPlan record);

    SalPlan selectByPrimaryKey(SalPlan record);

    int updateByPrimaryKeySelective(SalPlan record);

    int updateByPrimaryKey(SalPlan record);

    List<SalPlan> listSalPlan(SalPlan salPlan);

}
