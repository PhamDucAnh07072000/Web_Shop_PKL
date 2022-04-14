package com.sunshine.project_web.controller.frontend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "FrontEnd/Contact")
public class ContactController {

    @RequestMapping(value = "Map")
    public String ggMap(){
        return "frontend/contact";
    }

}
