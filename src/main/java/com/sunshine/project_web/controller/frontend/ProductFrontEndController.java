package com.sunshine.project_web.controller.frontend;

import com.sunshine.project_web.dto.CartModelDto;
import com.sunshine.project_web.dto.UserDetailCustom;
import com.sunshine.project_web.entities.ProductEntity;
import com.sunshine.project_web.paging.PagingAnnotation;
import com.sunshine.project_web.paging.PagingObject;
import com.sunshine.project_web.service.CartModelService;
import com.sunshine.project_web.service.CategoryService;
import com.sunshine.project_web.service.ProductService;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("FrontEnd/Product")
public class ProductFrontEndController {

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    CartModelService cartModelService;

    @GetMapping(value = "{id}")
    public String detail(@PathVariable String id, Model model) {
        ProductEntity productEntity =  productService.detailProduct(id);
        model.addAttribute("product", productEntity);
        model.addAttribute("userId", ((UserDetailCustom)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId());
        return "frontend/product-detail";
    }

    @PostMapping(value = "Cart", consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Object addToCart (@RequestBody CartModelDto cartModelDto) {
    // Lưu cart vào csdl
        cartModelService.saveCart(cartModelDto);
        return cartModelDto;
    }

//    @Data
//    public static class CartModel{
//        int number;
//        String productId;
//        Long userId;
//    }

    @GetMapping(value = "List")
    public String listProduct(@PagingAnnotation(path = "Product") PagingObject pagingObject, Model model){
        productService.findAll(pagingObject);
        model.addAttribute("category", categoryService.findAllCategory());
        return "frontend/product-list";
    }

//    @GetMapping(value = "List/{brand}" )
//    public String listCategoryProduct(@PathVariable String brand, Model model){
//        model.addAttribute("data", productService.listCategoryProduct(brand));
//        model.addAttribute("category", categoryService.findAllCategory());
//        return "frontend/product-list";
//    }
//
//    @GetMapping(value = "List/{start}/{end}" )
//    public String listPriceProduct(@PathVariable String start, @PathVariable String end, Model model){
//        model.addAttribute("data", productService.listPriceProduct(start, end));
//        model.addAttribute("category", categoryService.findAllCategory());
//        return "frontend/product-list";
//    }
}
