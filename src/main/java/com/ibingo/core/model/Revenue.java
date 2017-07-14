package com.ibingo.core.model;

import java.util.Date;

public class Revenue extends BaseModel{
    private Integer id;

    private String gameName;//游戏名称

    private String companyName;//公司名称

    private Integer registeredNum;//注册人数

    private Integer cuonsumOrderNum;//消费订单数

    private Integer cuonsumNum;//消费人数

    private Float cuonsumAmount;//消费金额

    private Date date;//日期

    private Date createDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public Integer getRegisteredNum() {
        return registeredNum;
    }

    public void setRegisteredNum(Integer registeredNum) {
        this.registeredNum = registeredNum;
    }

    public Integer getCuonsumOrderNum() {
        return cuonsumOrderNum;
    }

    public void setCuonsumOrderNum(Integer cuonsumOrderNum) {
        this.cuonsumOrderNum = cuonsumOrderNum;
    }

    public Integer getCuonsumNum() {
        return cuonsumNum;
    }

    public void setCuonsumNum(Integer cuonsumNum) {
        this.cuonsumNum = cuonsumNum;
    }

    public Float getCuonsumAmount() {
        return cuonsumAmount;
    }

    public void setCuonsumAmount(Float cuonsumAmount) {
        this.cuonsumAmount = cuonsumAmount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}