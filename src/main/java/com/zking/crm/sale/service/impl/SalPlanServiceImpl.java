package com.zking.crm.sale.service.impl;

import com.zking.crm.sale.mapper.SalPlanMapper;
import com.zking.crm.sale.model.SalPlan;
import com.zking.crm.sale.service.ISalPlanService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author mi
 * @create 2019-05-19 18:17
 */
@Service(value = "salPlanServiceImpl")
@Transactional
public class SalPlanServiceImpl implements ISalPlanService {

    @Resource
    private SalPlanMapper salPlanMapper;

    @Override
    public int deleteByPrimaryKey(Integer plaId) {
        return salPlanMapper.deleteByPrimaryKey(plaId);
    }

    @Override
    public int insert(SalPlan record) {
        return salPlanMapper.insert(record);
    }

    @Override
    public SalPlan selectByPrimaryKey(SalPlan record) {
        return salPlanMapper.selectByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(SalPlan record) {
        return salPlanMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SalPlan record) {
        return salPlanMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<SalPlan> listSalPlan(SalPlan salPlan) {
        return salPlanMapper.listSalPlan(salPlan);
    }
}
