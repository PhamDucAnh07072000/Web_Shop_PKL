package com.sunshine.project_web.controller.backend;


import com.sunshine.project_web.dto.ProductDto;
import com.sunshine.project_web.dto.UserDto;
import com.sunshine.project_web.paging.PagingAnnotation;
import com.sunshine.project_web.paging.PagingObject;
import com.sunshine.project_web.service.CategoryService;
import com.sunshine.project_web.service.UserService;
import com.sunshine.project_web.ultils.Constants;
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

import java.util.Arrays;

@Controller
@RequestMapping(value = "BackEnd/User")
@PreAuthorize("hasRole('ADMIN')")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = "Creat")
    public String CreatUser(Model model){
        model.addAttribute("permissions", Arrays.asList( new String[]{Constants.Permission.ADMIN,Constants.Permission.STAFF, Constants.Permission.MEMBER}));
        return "backend/user/creat";
    }

    @RequestMapping(value = "List")
    public String ListUser(@PagingAnnotation(path = "User") PagingObject pagingObject){
        userService.findAll(pagingObject);
        return "backend/user/list";
    }

    @RequestMapping(value = "Save", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String SaveUser(RedirectAttributes model, UserDto userDto){
        boolean result = userService.save(userDto);
        if(result == true){
            if(userDto.getId() == null){
                model.addFlashAttribute("messenger", "T???o User th??nh c??ng");
            }else {
                model.addFlashAttribute("messenger", "S???a User th??nh c??ng");
            }
        }else{
            model.addFlashAttribute("messenger", "Thao t??c th???t b???i");
        }
        return "redirect:/BackEnd/User/List";
    }

    @RequestMapping(value = "Detail/{id}")
    public String detailUser(@PathVariable String id, Model model){
        model.addAttribute("user", userService.detailUser(id));
        model.addAttribute("permissions", Arrays.asList( new String[]{Constants.Permission.ADMIN,Constants.Permission.STAFF, Constants.Permission.MEMBER}));
        return "backend/user/edit";
    }

    @RequestMapping(value = "Delete/{id}")
    public String deleteUser(@PathVariable Long id, RedirectAttributes model){
        boolean result = userService.deleteUser(id);
        if (result == true){
            model.addFlashAttribute("messenger", "X??a s???n ph???m th??nh c??ng");
        }else {
            model.addFlashAttribute("messenger", "X??a s???n ph???m kh??ng th??nh c??ng");
        }
        return "redirect:/BackEnd/User/List";
    }



//    @RequestMapping(value = "changePassWord")
//    public String changePass(){
//        return "changePassWord";
//    }
//
//    @RequestMapping(value = "verify/{id}")
//    public String verify(@PathVariable Long id, @RequestParam(name = "passWord", required = false) String passWd, RedirectAttributes model){
//        userService.updatePassWord(passWd, id);
//        model.addFlashAttribute("messenger", "x??c nh???n th??nh c??ng");
//        return "redirect:/_admin/login";
//    }
//
//    @RequestMapping(value = "changePassWord", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
//    public String changePassWd(UserDto userDto){
//        userService.sendMailUser(userDto);
//        return "redirect:/BackEnd/User/changePassWord";
//    }
}
