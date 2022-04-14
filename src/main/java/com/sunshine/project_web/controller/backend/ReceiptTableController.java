package com.sunshine.project_web.controller.backend;


import com.sunshine.project_web.dto.CheckOutCartDto;
import com.sunshine.project_web.paging.PagingAnnotation;
import com.sunshine.project_web.paging.PagingObject;
import com.sunshine.project_web.service.CategoryService;
import com.sunshine.project_web.service.CheckOutCartService;
import com.sunshine.project_web.ultils.ConstantsStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;

@Controller
@RequestMapping(value = "BackEnd/Receipt")
@PreAuthorize("hasAnyRole('STAFF', 'ADMIN')")
public class ReceiptTableController {

    @Autowired
    CheckOutCartService checkOutCartService;

    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = "List")
    public String listReceipt(Model model, @PagingAnnotation(path = "Receipt") PagingObject pagingObject){
        checkOutCartService.findAll(pagingObject);
        model.addAttribute("statusCon", Arrays.asList(new String[]{ConstantsStatus.Status.CancelOder, ConstantsStatus.Status.OderSucces, ConstantsStatus.Status.Delivering, ConstantsStatus.Status.Successful}));
        return "backend/receipt/receiptTable";
    }

    @PostMapping(value = "/UpdateCheckOut/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Object checkOutCart(@PathVariable Long id, @RequestBody CheckOutCartDto checkOutCartDto){
        checkOutCartService.updateCheckOut(checkOutCartDto, id );
        return checkOutCartDto;
    }


}
