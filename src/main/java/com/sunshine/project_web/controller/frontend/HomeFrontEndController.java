package com.sunshine.project_web.controller.frontend;

import com.sunshine.project_web.entities.ProductEntity;
import com.sunshine.project_web.service.ProductService;
import com.sunshine.project_web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HomeFrontEndController {

    @Autowired
    ProductService productService;

    @Autowired
    UserService userService;

    @RequestMapping(value = {"/", "Home"})
    public String homeFrontEnd(Model model){
        model.addAttribute("highestPrice", productService.detailPrice());
        model.addAttribute("listDucati", productService.listDucati());
        model.addAttribute("listLatestDucati", productService.listLatestProduct());
        model.addAttribute("listAdmin", userService.detailAdmin());
        return "frontend/home";
    }

    @GetMapping(value = "{id}")
    public String detail(@PathVariable String id, Model model) {
        ProductEntity productEntity =  productService.detailProduct(id);
        model.addAttribute("product", productEntity);
        return "frontend/product-detail";
    }
}
