package com.sunshine.project_web.controller.frontend;


import com.sunshine.project_web.entities.CheckoutcartEntity;
import com.sunshine.project_web.service.CheckOutCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "FrontEnd/Receipt")
public class ReceiptController {

    @Autowired
    CheckOutCartService checkOutCartService;

    @RequestMapping(value = "List/{userId}")
    public String listReciept(Model model, @PathVariable Long userId){
        List<CheckoutcartEntity> checkoutcartEntities = checkOutCartService.listCheckOut(userId);
        model.addAttribute("listCart", checkoutcartEntities);
        return "frontend/receipt";
    }
}
