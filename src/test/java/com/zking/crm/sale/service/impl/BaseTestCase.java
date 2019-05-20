package com.zking.crm.sale.service.impl;

import com.zking.crm.sale.utils.PageBean;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author shkstart
 * @create 2019-04-18 15:41
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring.xml"})
public class BaseTestCase {

    protected PageBean pageBean;

    @Before
    public void  before(){
        pageBean=new PageBean();
    }
}
