package com.java1234.controller.admin;

//管理员商品大类Controller

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.java1234.entity.PageBean;
import com.java1234.entity.R;
import com.java1234.entity.BigType;
import com.java1234.entity.SmallType;
import com.java1234.service.IBigTypeService;
import com.java1234.service.ISmallTypeService;
import com.java1234.util.DateUtil;
import com.java1234.util.StringUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/admin/bigType")
public class AdminBigTypeController {

    @Autowired
    private IBigTypeService bigTypeService;

    @Autowired
    private ISmallTypeService smallTypeService;

    @Value("${bigTypeImagesFilePath}")
    private String bigTypeImagesFilePath;

    //根据条件分类查询商品大类信息

    @RequestMapping("/list")
    public R list (@RequestBody PageBean pageBean) {
        System.out.println(pageBean);
        String query = pageBean.getQuery().trim();
        Page<BigType> page = new Page<>(pageBean.getPageNum(), pageBean.getPageSize());
        Page<BigType> pageResult = bigTypeService.page(page, new QueryWrapper<BigType>().like(StringUtil.isNotEmpty(query), "name", query));
        Map<String, Object> map = new HashMap<>();
        map.put("bigTypeList", pageResult.getRecords());
        map.put("total", pageResult.getTotal());
        return R.ok(map);
    }

    //更新和修改
    @RequestMapping("/save")
    public R save(@RequestBody BigType bigType){
        if(bigType.getId()==null || bigType.getId()==-1){
            bigTypeService.save(bigType);
        }else{
            bigTypeService.saveOrUpdate(bigType);
        }
        return R.ok();
    }

    //根据id查询
    @GetMapping("/{id}")
    public R findById(@PathVariable(value = "id")Integer id){
        BigType bigType = bigTypeService.getById(id);
        Map<String, Object> map = new HashMap<>();
        map.put("bigType", bigType);
        return R.ok(map);
    }

    //删除
    @GetMapping("/delete/{id}")
    public R delete(@PathVariable(value = "id") Integer id){
        //判断 如果大类下有小类 返回报错
        if(smallTypeService.count(new QueryWrapper<SmallType>().eq("bigTypeId", id))>0){
            return R.error(500, "大类下有小类消息，不能删除");
        }else{
            bigTypeService.removeById(id);
            return R.ok();
        }
    }

    //上传图片
    @RequestMapping("/uploadImage")
    public Map<String , Object> uploadImage(MultipartFile file) throws Exception{
        Map<String , Object> resultMap = new HashMap<>();
        if(!file.isEmpty()){

            String originalFilename = file.getOriginalFilename();
            String suffixName = originalFilename.substring(originalFilename.lastIndexOf("."));
            String newFileName = DateUtil.getCurrentDateStr()+suffixName;
            FileUtils.copyInputStreamToFile(file.getInputStream(),new File(bigTypeImagesFilePath+newFileName));
            resultMap.put("cpde", 0);
            resultMap.put("msg", "上传成功");
            Map<String , Object> dataMap = new HashMap<>();
            dataMap.put("title",newFileName);
            dataMap.put("src","/image/bigType/"+newFileName);
            resultMap.put("data",dataMap);
        }
        return resultMap;
    }

    //查询所有数据 下拉框
    @RequestMapping("/listAll")
    public R listAll(){
        Map<String , Object> map = new HashMap<>();
        map.put("bigTypeList", bigTypeService.list());
        return R.ok(map);
    }

}
