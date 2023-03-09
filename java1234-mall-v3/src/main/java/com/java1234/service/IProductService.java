package com.java1234.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.java1234.entity.Product;

import java.util.List;
import java.util.Map;

//商品Service接口

public interface IProductService extends IService<Product> {
    List<Product> list(Map<String, Object> map);

    Long getTotal(Map<String, Object> map);

    void add(Product product);

    void update(Product product);

    Product findById(Integer id);
}
