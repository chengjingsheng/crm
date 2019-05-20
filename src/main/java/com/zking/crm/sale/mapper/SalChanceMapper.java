package com.zking.crm.sale.mapper;

import com.zking.crm.sale.model.SalChance;

import java.util.List;

public interface SalChanceMapper {
    int deleteByPrimaryKey(Integer chcId);

    int insert(SalChance record);

    int insertSelective(SalChance record);

    SalChance selectByPrimaryKey(SalChance salChance);

    int updateByPrimaryKeySelective(SalChance record);

    int updateByPrimaryKey(SalChance record);

    List<SalChance> listSalChances(SalChance salChance);

    List<SalChance> listSalPlan(SalChance salChance);
}