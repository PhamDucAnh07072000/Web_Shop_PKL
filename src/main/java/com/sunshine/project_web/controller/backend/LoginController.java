package com.sunshine.project_web.controller.backend;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    @RequestMapping(value = "_admin/login")
    public String login(){
        return "login";
    }
}
