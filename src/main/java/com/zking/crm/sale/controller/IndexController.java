package com.zking.crm.sale.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author mi
 * @create 2019-05-17 16:37
 */
@Controller
public class IndexController {

    @RequestMapping("/zking/zking.shtml")
    public  String toIdex(){
        return "index";
    }

    @RequestMapping("/sal/toadd")
    public String toadd(){
        return "sale/add";
    }

    @RequestMapping("/sal/toedit")
    public String toedit(){

        return "sale/edit";
    }


    @RequestMapping("/sal/tolist")
    public String tolist(){

        return "sale/list";
    }

    @RequestMapping("/sal/todispatch")
    public String todispatch(){

        return "sale/dispatch";
    }

    @RequestMapping("/sal/todev")
    public String todev(){

        return "sale/dev";
    }


}
