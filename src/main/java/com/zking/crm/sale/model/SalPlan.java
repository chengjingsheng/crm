package com.zking.crm.sale.model;

import lombok.Data;
import lombok.ToString;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Component
@ToString
@Data
public class SalPlan implements Serializable {
    private Integer plaId;

    private Integer plaChcId;

    private Date plaDate;

    private String plaTodo;

    private String plaResult;

    private List<SalChance> salChanceList;

    public SalPlan(Integer plaId, Integer plaChcId, Date plaDate, String plaTodo, String plaResult) {
        this.plaId = plaId;
        this.plaChcId = plaChcId;
        this.plaDate = plaDate;
        this.plaTodo = plaTodo;
        this.plaResult = plaResult;
    }

    public SalPlan() {
        super();
    }

    public Integer getPlaId() {
        return plaId;
    }

    public void setPlaId(Integer plaId) {
        this.plaId = plaId;
    }

    public Integer getPlaChcId() {
        return plaChcId;
    }

    public void setPlaChcId(Integer plaChcId) {
        this.plaChcId = plaChcId;
    }

    public Date getPlaDate() {
        return plaDate;
    }

    public void setPlaDate(Date plaDate) {
        this.plaDate = plaDate;
    }

    public String getPlaTodo() {
        return plaTodo;
    }

    public void setPlaTodo(String plaTodo) {
        this.plaTodo = plaTodo;
    }

    public String getPlaResult() {
        return plaResult;
    }

    public void setPlaResult(String plaResult) {
        this.plaResult = plaResult;
    }
}