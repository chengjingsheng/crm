package com.zking.crm.sale.service;

import com.zking.crm.sale.model.SalChance;
import com.zking.crm.sale.utils.PageBean;

import java.util.List;

/**
 * @author mi
 * @create 2019-05-17 14:21
 */
public interface ISalChanceService {

    int deleteByPrimaryKey(Integer chcId);

    int insert(SalChance record);


    SalChance selectByPrimaryKey(SalChance salChance);

    int updateByPrimaryKeySelective(SalChance record);

    int updateByPrimaryKey(SalChance record);

    List<SalChance> listSalChances(SalChance salChance, PageBean pageBean);

    List<SalChance> listSalPlan(SalChance salChance);
}
