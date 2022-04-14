package com.sunshine.project_web.controller.backend;

import com.sunshine.project_web.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@PreAuthorize("hasAnyRole('STAFF', 'ADMIN')")
public class HomeBackendController {
    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = "BackEnd/**")
    public String homeBackEnd(Model model){
        model.addAttribute("listCategory", categoryService.findAllCategory());
        return "common/nav-header";
    }


}
