package com.zking.crm.sale.controller;

import com.zking.crm.sale.model.ResponseResult;
import com.zking.crm.sale.model.SalChance;
import com.zking.crm.sale.model.SalPlan;
import com.zking.crm.sale.service.ISalChanceService;
import com.zking.crm.sale.service.ISalPlanService;
import com.zking.crm.sale.utils.PageBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author mi
 * @create 2019-05-17 14:45
 */
@Controller
@RequestMapping("/sale")

public class SalChanceController {

    @Resource(name = "iSalChanceServiceImpl")
    private ISalChanceService salChanceService;
    @Resource(name = "salPlanServiceImpl")
    private ISalPlanService salPlanService;

    @ModelAttribute
    public void init(Model model) {
        SalChance salChance = new SalChance();
        SalPlan salPlan = new SalPlan();
        model.addAttribute("salChance", salChance);
        model.addAttribute("salPlan", salPlan);

    }


    //销售机会管理开始
    @RequestMapping(value = "/addSale", produces = "application/json;text/html;charset=UTF-8")
    @ResponseBody
    public ResponseResult<Map<String, Object>> addSale(SalChance salChance, BindingResult bindingResult, Model model) throws ParseException {
        System.out.println(salChance.getChcCustName() + "------");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        salChance.setChcCreateDate(sdf.parse(salChance.getDatestring()));
        System.out.println(salChance.getChcCreateDate());
        ResponseResult<Map<String, Object>> responseResult = new ResponseResult<Map<String, Object>>(1, "增加成功", null);
        if (bindingResult.hasErrors()) {
            Map<String, Object> errors = new HashMap<String, Object>();
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError f : fieldErrors) {
                System.out.println(f.getField());
                System.out.println(f.getDefaultMessage());

                String field = f.getField();
                String message = f.getDefaultMessage();
                errors.put(field, message);

            }
            responseResult.setStatus(0);
            responseResult.setMessage("增加失败");
            responseResult.setData(errors);
            return responseResult;
        }
        boolean b = model.containsAttribute("salChance");
        int insert = salChanceService.insert(salChance);
        return responseResult;
    }

    @RequestMapping(value = "/salChanceList")
    public ModelAndView salChanceList(SalChance salChance, ModelAndView modelAndView, HttpServletRequest request) {
        PageBean pageBean = new PageBean();
        pageBean.setRequest(request);
        System.out.println(salChance.getChcCustName() + "--------");
        List<SalChance> list = salChanceService.listSalChances(salChance, pageBean);
        modelAndView.addObject("list", list);
        modelAndView.addObject("pageBean", pageBean);
        modelAndView.setViewName("/sale/list");
        return modelAndView;
    }

    @RequestMapping(value = "/editSale", produces = "application/json;text/html;charset=UTF-8")
    @ResponseBody
    public ResponseResult<Map<String, Object>> editSale(SalChance salChance, BindingResult bindingResult, Model model) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        salChance.setChcCreateDate(sdf.parse(salChance.getDatestring()));
        System.out.println(salChance.getChcCreateDate());
        ResponseResult<Map<String, Object>> responseResult = new ResponseResult<Map<String, Object>>(1, "修改成功", null);
        if (bindingResult.hasErrors()) {
            Map<String, Object> errors = new HashMap<String, Object>();
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError f : fieldErrors) {
                System.out.println(f.getField());
                System.out.println(f.getDefaultMessage());

                String field = f.getField();
                String message = f.getDefaultMessage();
                errors.put(field, message);

            }
            responseResult.setStatus(0);
            responseResult.setMessage("修改失败");
            responseResult.setData(errors);
            return responseResult;
        }
        boolean b = model.containsAttribute("salChance");
        int insert = salChanceService.updateByPrimaryKeySelective(salChance);
        return responseResult;
    }

    @RequestMapping(value = "/delSale", produces = "application/json;text/html;charset=UTF-8")
    @ResponseBody
    public ResponseResult<Map<String, Object>> delSale(SalChance salChance, Model model, BindingResult bindingResult) {

        ResponseResult<Map<String, Object>> responseResult = new ResponseResult<Map<String, Object>>(1, "删除成功", null);
        if (bindingResult.hasErrors()) {
            Map<String, Object> errors = new HashMap<String, Object>();
            responseResult.setStatus(0);
            responseResult.setMessage("删除失败");
            responseResult.setData(errors);
            return responseResult;
        }
        boolean b = model.containsAttribute("salChance");
        int insert = salChanceService.deleteByPrimaryKey(salChance.getChcId());
        return responseResult;
    }

    @RequestMapping("/salChanceload")
    public ModelAndView salChanceload(SalChance salChance, ModelAndView modelAndView, HttpServletRequest request) {
        SalChance salChance1 = salChanceService.selectByPrimaryKey(salChance);

        modelAndView.addObject("salChance1", salChance1);
        modelAndView.setViewName("/sale/edit");
        return modelAndView;
    }

    //销售机会管理结束

    //指派开始

    //查询单个
    @RequestMapping("/loaddispatch")
    public ModelAndView loaddispatch(SalChance salChance, ModelAndView modelAndView, HttpServletRequest request) {
        SalChance salChance1 = salChanceService.selectByPrimaryKey(salChance);
        modelAndView.addObject("salChance1", salChance1);
        modelAndView.setViewName("/sale/dispatch");
        return modelAndView;
    }

    //修改
    @RequestMapping(value = "/updateDispatch", produces = "application/json;text/html;charset=UTF-8")
    @ResponseBody
    public ResponseResult<Map<String, Object>> updateDispatch(SalChance salChance, BindingResult bindingResult, Model model) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        salChance.setChcDueDate(sdf.parse(salChance.getDatestring()));
        System.out.println(salChance.getChcId() + "----id");
        System.out.println(salChance.getChcDueTo());
        System.out.println(salChance.getChcDueDate());
        System.out.println(salChance.getChcStatus() + "------");

        ResponseResult<Map<String, Object>> responseResult = new ResponseResult<Map<String, Object>>(1, "指派成功", null);
        if (bindingResult.hasErrors()) {
            Map<String, Object> errors = new HashMap<String, Object>();
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError f : fieldErrors) {
                System.out.println(f.getField());
                System.out.println(f.getDefaultMessage());

                String field = f.getField();
                String message = f.getDefaultMessage();
                errors.put(field, message);

            }
            responseResult.setStatus(0);
            responseResult.setMessage("指派失败");
            responseResult.setData(errors);
            return responseResult;
        }
        boolean b = model.containsAttribute("salChance");
        int insert = salChanceService.updateByPrimaryKeySelective(salChance);
        return responseResult;
    }

    //指派结束


    //客户开发计划开始
    @RequestMapping(value = "/salPlanList")
    public ModelAndView salPlanList(SalChance salChance, ModelAndView modelAndView, HttpServletRequest request) {
        PageBean pageBean = new PageBean();
        pageBean.setRequest(request);
        System.out.println(salChance.getChcCustName() + "--------");
        List<SalChance> list = salChanceService.listSalPlan(salChance);
        modelAndView.addObject("list", list);
        modelAndView.setViewName("/sale/dev");
        return modelAndView;
    }

    //增加
    @RequestMapping(value = "/addSalPlan", produces = "application/json;text/html;charset=UTF-8")
    @ResponseBody
    public ResponseResult<Map<String, Object>> addSalPlan(SalPlan salPlan, BindingResult bindingResult, Model model) throws ParseException {
        System.out.println(salPlan.getPlaTodo() + "----");
        salPlan.setPlaDate(new Date());
        ResponseResult<Map<String, Object>> responseResult = new ResponseResult<Map<String, Object>>(1, "制定成功", null);
        if (bindingResult.hasErrors()) {
            Map<String, Object> errors = new HashMap<String, Object>();
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError f : fieldErrors) {
                System.out.println(f.getField());
                System.out.println(f.getDefaultMessage());

                String field = f.getField();
                String message = f.getDefaultMessage();
                errors.put(field, message);

            }
            responseResult.setStatus(0);
            responseResult.setMessage("制定失败");
            responseResult.setData(errors);
            return responseResult;
        }
        boolean b = model.containsAttribute("salPlan");
        int insert = salPlanService.insert(salPlan);
        return responseResult;
    }

    //修改
    @RequestMapping(value = "/updateSalPlan", produces = "application/json;text/html;charset=UTF-8")
    @ResponseBody
    public ResponseResult<Map<String, Object>> updateSalPlan(SalPlan salPlan, BindingResult bindingResult, Model model) throws ParseException {
        System.out.println(salPlan.getPlaTodo()+"-----idsalplan");
        System.out.println(salPlan.getPlaChcId());
        ResponseResult<Map<String, Object>> responseResult = new ResponseResult<Map<String, Object>>(1, "修改成功", null);
        if (bindingResult.hasErrors()) {
            Map<String, Object> errors = new HashMap<String, Object>();
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError f : fieldErrors) {
                System.out.println(f.getField());
                System.out.println(f.getDefaultMessage());

                String field = f.getField();
                String message = f.getDefaultMessage();
                errors.put(field, message);

            }
            responseResult.setStatus(0);
            responseResult.setMessage("修改失败");
            responseResult.setData(errors);
            return responseResult;
        }
        boolean b = model.containsAttribute("salChance");
        int insert = salPlanService.updateByPrimaryKeySelective(salPlan);
        return responseResult;
    }

    //删除

    @RequestMapping(value = "/delSalPlan", produces = "application/json;text/html;charset=UTF-8")
    @ResponseBody
    public ResponseResult<Map<String, Object>> delSalPlan(SalPlan salPlan, Model model, BindingResult bindingResult) {
        System.out.println(salPlan.getPlaId()+"!!!!");
        ResponseResult<Map<String, Object>> responseResult = new ResponseResult<Map<String, Object>>(1, "删除成功", null);
        if (bindingResult.hasErrors()) {
            Map<String, Object> errors = new HashMap<String, Object>();
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError f : fieldErrors) {
                System.out.println(f.getField());
                System.out.println(f.getDefaultMessage());

                String field = f.getField();
                String message = f.getDefaultMessage();
                errors.put(field, message);

            }
            responseResult.setStatus(0);
            responseResult.setMessage("删除失败");
            responseResult.setData(errors);
            return responseResult;
        }
        boolean b = model.containsAttribute("salPlan");
        int insert = salPlanService.deleteByPrimaryKey(salPlan.getPlaId());
        return responseResult;
    }

    @RequestMapping("/loadSalPlan")
    public ModelAndView loadSalPlan(SalPlan salPlan,ModelAndView modelAndView, HttpServletRequest request) {
        List<SalPlan> salPlans = salPlanService.listSalPlan(salPlan);
        SalChance salChance=new SalChance();
        salChance.setChcId(salPlan.getPlaChcId());
        SalChance salChance1 = salChanceService.selectByPrimaryKey(salChance);
        modelAndView.addObject("salChance1", salChance1);
        modelAndView.addObject("salPlans",salPlans);
        modelAndView.setViewName("/sale/dev_plan");
        return modelAndView;
    }

    @RequestMapping("/loadSalPlan1")
    public ModelAndView loadSalPlan1(SalPlan salPlan,String surl,ModelAndView modelAndView, HttpServletRequest request) {
        List<SalPlan> salPlans = salPlanService.listSalPlan(salPlan);
        SalChance salChance=new SalChance();
        salChance.setChcId(salPlan.getPlaChcId());
        SalChance salChance1 = salChanceService.selectByPrimaryKey(salChance);
        modelAndView.addObject("salChance1", salChance1);
        modelAndView.addObject("salPlans",salPlans);
        modelAndView.setViewName("/sale/dev_execute");
        return modelAndView;
    }


    //客户开发计划结束


}
