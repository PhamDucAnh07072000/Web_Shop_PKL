package com.sunshine.project_web.controller.backend;


import com.sunshine.project_web.dto.UserDto;
import com.sunshine.project_web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "BackEnd/Email")
public class emailController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "changePassWord")
    public String changePass(){
        return "changePassWord";
    }

    @RequestMapping(value = "verify/{id}")
    public String verify(@PathVariable Long id, @RequestParam(name = "passWord", required = false) String passWd, RedirectAttributes model){
        userService.updatePassWord(passWd, id);
        model.addFlashAttribute("messenger", "xác nhận thành công");
        return "redirect:/_admin/login";
    }

    @RequestMapping(value = "changePassWord", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String changePassWd(UserDto userDto){
        userService.sendMailUser(userDto);
        return "redirect:/BackEnd/Email/changePassWord";
    }
}
