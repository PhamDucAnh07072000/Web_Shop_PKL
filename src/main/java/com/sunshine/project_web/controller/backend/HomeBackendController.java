package com.sunshine.project_web.controller.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "BackEnd/")
public class HomeBackendController {

    @RequestMapping(value = "HomeBackEnd")
    public String homeBackEnd(){
        return "backend/home";
    }

}
