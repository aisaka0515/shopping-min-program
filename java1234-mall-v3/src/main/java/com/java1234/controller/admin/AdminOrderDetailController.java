package com.java1234.controller.admin;


//管理员订单详情Controller

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.java1234.entity.OrderDetail;
import com.java1234.entity.R;
import com.java1234.service.IOrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/orderDetail")
public class AdminOrderDetailController {

    @Autowired
    private IOrderDetailService orderDetailService;


    //根据订单号查询商品订单详情
    @RequestMapping("/list/{id}")
    public R listByOrderId(@PathVariable (value = "id") Integer id){
        List<OrderDetail> orderDetailList = orderDetailService.list(new QueryWrapper<OrderDetail>().eq("mId", id));
        Map<String, Object> map = new HashMap<>();
        map.put("list", orderDetailList);
        return R.ok(map);
    }


}