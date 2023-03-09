package com.java1234.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.java1234.entity.Order;

import java.util.List;
import java.util.Map;

//订单接口

public interface IOrderService extends IService<Order> {

    //根据条件分页查询订单数据

    List<Order> list(Map<String, Object> map);

    //根据条件查询订单总记录数

    Long getTotal(Map<String, Object> map);
}
