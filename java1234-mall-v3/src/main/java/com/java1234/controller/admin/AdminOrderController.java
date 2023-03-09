package com.java1234.controller.admin;

//管理员订单Controller

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.java1234.entity.Order;
import com.java1234.entity.OrderDetail;
import com.java1234.entity.PageBean;
import com.java1234.entity.R;
import com.java1234.service.IOrderDetailService;
import com.java1234.service.IOrderService;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/order")
public class AdminOrderController {

    @Autowired
    private IOrderService orderService;

    @Autowired
    private IOrderDetailService orderDetailService;



    @RequestMapping("/list")
    public R list (@RequestBody PageBean pageBean){
        System.out.println(pageBean);
        Map<String, Object> map = new HashMap<>();
        map.put("orderNo", pageBean.getQuery().trim());
        map.put("start", pageBean.getStart());
        map.put("pageSize", pageBean.getPageSize());
        List<Order> orderList = orderService.list(map);
        Long total = orderService.getTotal(map);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("orderList", orderList);
        resultMap.put("total", total);
        return R.ok(resultMap);
    }

    @PostMapping("/updateStatus")
    public R updateStatus(@RequestBody Order order){
        Order resultOrder = orderService.getById(order.getId());
        resultOrder.setStatus(order.getStatus());
        orderService.saveOrUpdate(resultOrder);
        return R.ok();
    }

    //删除
    @GetMapping("/delete/{id}")
    public R delete(@PathVariable(value = "id") Integer id){
        //删除订单细表数据
        orderDetailService.remove(new QueryWrapper<OrderDetail>().eq("mid",id));
        orderService.removeById(id);
        return R.ok();
    }


}
