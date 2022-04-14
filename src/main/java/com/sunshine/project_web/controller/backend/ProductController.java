package com.sunshine.project_web.controller.backend;


import com.sunshine.project_web.dto.ProductDto;
import com.sunshine.project_web.paging.PagingAnnotation;
import com.sunshine.project_web.paging.PagingObject;
import com.sunshine.project_web.service.CategoryService;
import com.sunshine.project_web.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "BackEnd/Product")
@PreAuthorize("hasAnyRole('STAFF', 'ADMIN')")
public class ProductController {
    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = "Creat")
    public String creatProduct(Model model){
        model.addAttribute("brand", categoryService.findAllCategory());
        return "backend/product/creat";
    }

    @RequestMapping(value = "List")
    public String listProduct(@PagingAnnotation(path = "Product") PagingObject pagingObject){
        productService.findAll(pagingObject);
        return "backend/product/list";
    }

    @RequestMapping(value = "Save", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String saveProduct(RedirectAttributes model, ProductDto productDto){
        boolean result = productService.save(productDto);
        if(result == true){
            if(productDto.getId() == null){
                model.addFlashAttribute("messenger", "Tạo sản phẩm thành công");
            }else {
                model.addFlashAttribute("messenger", "Sửa sản phẩm thành công");
            }
        }else{
            model.addFlashAttribute("messenger", "Thao tác thất bại");
        }
        return "redirect:/BackEnd/Product/List";
    }

    @RequestMapping(value = "Detail/{id}")
    public String detailProduct(@PathVariable String id, Model model){
        model.addAttribute("product", productService.detailProduct(id));
        model.addAttribute("brand", categoryService.findAllCategory());
        return "backend/product/edit";
    }

    @RequestMapping(value = "Delete/{id}")
    public String deleteProduct(@PathVariable Long id, RedirectAttributes model){
        boolean result = productService.deleteProduct(id);
        if (result == true){
            model.addFlashAttribute("messenger", "Xóa sản phẩm thành công");
        }else {
            model.addFlashAttribute("messenger", "Xóa sản phẩm không thành công");
        }
        return "redirect:/BackEnd/Product/List";
    }


}
