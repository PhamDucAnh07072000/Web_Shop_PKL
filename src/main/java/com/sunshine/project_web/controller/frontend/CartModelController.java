package com.sunshine.project_web.controller.frontend;

import com.sunshine.project_web.dto.CartModelDto;
import com.sunshine.project_web.dto.CheckOutCartDto;
import com.sunshine.project_web.dto.UserDetailCustom;
import com.sunshine.project_web.entities.CartmodelEntity;
import com.sunshine.project_web.service.CartModelService;
import com.sunshine.project_web.service.CheckOutCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = "FrontEnd/Cart")
public class CartModelController {

    @Autowired
    CartModelService cartModelService;

    @Autowired
    CheckOutCartService checkOutCartService;

    @RequestMapping(value = "List/{userid}")
    public String list(Model model, @PathVariable Long userid){
        List<CartmodelEntity> cartmodelEntities = cartModelService.cartList(userid);
        model.addAttribute("listCart", cartmodelEntities);
        return "frontend/cartlist";
    }

    @RequestMapping(value = "/Delete/{userId}")
    public String listDelete(Model model, @PathVariable Long userId){
        cartModelService.deleteCart(userId);
        return "frontend/cartlist";
    }


    @RequestMapping(value = "/UpdateNumber/{userId}/{productId}", method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Object updateCart (@PathVariable Long userId, @PathVariable Long productId, @RequestBody CartModelDto cartModelDto) {
        cartModelService.updateCart(cartModelDto, userId, productId);
        return cartModelDto;
    }

    @PostMapping(value = "/CheckOutCard/{userId}", consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Object checkOutCart(Model model, @PathVariable Long userId,@RequestBody CheckOutCartDto checkOutCartDto){
        cartModelService.deleteCart(userId);
        checkOutCartService.SaveCheckOutCart(checkOutCartDto);
        return checkOutCartDto;
    }

}
