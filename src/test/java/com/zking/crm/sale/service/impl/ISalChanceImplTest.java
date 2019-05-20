package com.zking.crm.sale.service.impl;

import com.sun.org.apache.xpath.internal.operations.String;
import com.zking.crm.sale.model.SalChance;
import com.zking.crm.sale.service.ISalChanceService;
import org.junit.Test;

import javax.annotation.Resource;
import javax.xml.crypto.Data;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

/**
 * @author mi
 * @create 2019-05-17 14:29
 */
public class ISalChanceImplTest extends  BaseTestCase {

    @Resource(name = "iSalChanceServiceImpl")
    private ISalChanceService salChanceService;
    private  SalChance salChance;
    @Override
    public void before() {
        super.before();
        salChance = new SalChance();
    }

    @Test
    public void deleteByPrimaryKey() {
    }

    @Test
    public void insert() {
        salChance.setChcCustName("李鑫王八蛋");
        salChance.setChcLinkman("新老狗");
        int insert = salChanceService.insert(salChance);
        System.out.println(insert);
    }

    @Test
    public void selectByPrimaryKey() {
        salChance.setChcId(1);
        SalChance salChance = salChanceService.selectByPrimaryKey(this.salChance);
        System.out.println(salChance);


    }

    @Test
    public void updateByPrimaryKey() {
        salChance.setChcId(4);
        salChance.setChcStatus("2");
        salChanceService.updateByPrimaryKeySelective(salChance);
    }

    @Test
    public void listSalChances() {

        List<SalChance> list = salChanceService.listSalChances(salChance, pageBean);
        for (SalChance chance : list) {
            System.out.println(chance);
        }
    }
}