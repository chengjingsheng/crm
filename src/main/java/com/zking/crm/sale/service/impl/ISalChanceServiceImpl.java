package com.zking.crm.sale.service.impl;

import com.zking.crm.sale.mapper.SalChanceMapper;
import com.zking.crm.sale.model.SalChance;
import com.zking.crm.sale.service.ISalChanceService;
import com.zking.crm.sale.utils.PageBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author mi
 * @create 2019-05-17 14:26
 */
@Service(value = "iSalChanceServiceImpl")
@Transactional
public class ISalChanceServiceImpl implements ISalChanceService {

    @Resource
    private SalChanceMapper salChanceMapper;

    @Override
    public int deleteByPrimaryKey(Integer chcId) {
        return salChanceMapper.deleteByPrimaryKey(chcId);
    }

    @Override
    public int insert(SalChance record) {
        return salChanceMapper.insert(record);
    }

    @Override
    public SalChance selectByPrimaryKey(SalChance salChance) {
        return salChanceMapper.selectByPrimaryKey(salChance);
    }

    @Override
    public int updateByPrimaryKeySelective(SalChance record) {
        return salChanceMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SalChance record) {
        return salChanceMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<SalChance> listSalChances(SalChance salChance, PageBean pageBean) {
        return salChanceMapper.listSalChances(salChance);
    }

    @Override
    public List<SalChance> listSalPlan(SalChance salChance) {
        return salChanceMapper.listSalPlan(salChance);
    }
}
