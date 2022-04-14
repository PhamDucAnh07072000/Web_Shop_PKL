package com.sunshine.project_web.controller.backend;

import com.sunshine.project_web.dto.CategoryDto;
import com.sunshine.project_web.dto.ProductDto;
import com.sunshine.project_web.paging.PagingAnnotation;
import com.sunshine.project_web.paging.PagingObject;
import com.sunshine.project_web.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "BackEnd/Category")
@PreAuthorize("hasAnyRole('STAFF', 'ADMIN')")
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = "Creat")
    public String creatProduct(){
        return "backend/category/creat";
    }

    @RequestMapping(value = "List")
    public String listProduct(@PagingAnnotation(path = "Category") PagingObject pagingObject){
        categoryService.findAll(pagingObject);
        return "backend/category/list";
    }

    @RequestMapping(value = "Save", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String saveProduct(RedirectAttributes model, CategoryDto categoryDto){
        boolean result = categoryService.save(categoryDto);
        if(result == true){
            if(categoryDto.getId() == null){
                model.addFlashAttribute("messenger", "Tạo danh mục thành công");
            }else {
                model.addFlashAttribute("messenger", "Sửa danh mục thành công");
            }
        }else{
            model.addFlashAttribute("messenger", "Thao tác thất bại");
        }
        return "redirect:/BackEnd/Category/List";
    }

    @RequestMapping(value = "Detail/{id}")
    public String detailProduct(@PathVariable Long id, Model model){
        model.addAttribute("category", categoryService.detailCategory(id));
        return "backend/category/edit";
    }

    @RequestMapping(value = "Delete/{id}")
    public String deleteProduct(@PathVariable Long id, RedirectAttributes model){
        boolean result = categoryService.deleteProduct(id);
        if (result == true){
            model.addFlashAttribute("messenger", "Xóa danh mục thành công");
        }else {
            model.addFlashAttribute("messenger", "Xóa danh mục không thành công");
        }
        return "redirect:/BackEnd/Category/List";
    }


}
