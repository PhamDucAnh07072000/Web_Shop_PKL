package com.sunshine.project_web.controller.backend;


import com.sunshine.project_web.dto.UserDto;
import com.sunshine.project_web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "_admin/login")
    public String login(){
        return "login";
    }

    @RequestMapping(value = "_member/signup")
    public String signup(){
        return "signup";
    }

    @RequestMapping(value = "Save", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String SaveUser(RedirectAttributes model, UserDto userDto){
        userDto.setPermissions("MEMBER");
        boolean result = userService.save(userDto);
        if(result == true){
                model.addFlashAttribute("messenger", "Tạo User thành công");
        }else{
            model.addFlashAttribute("messenger", "Thao tác thất bại");
        }
        return "redirect:/_admin/login";
    }
}
