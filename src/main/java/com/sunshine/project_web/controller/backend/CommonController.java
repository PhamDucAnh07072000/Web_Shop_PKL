package com.sunshine.project_web.controller.backend;

import com.sunshine.project_web.dto.common.Responsedto;
import com.sunshine.project_web.ultils.FileUntils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "BackEnd/Common")
public class CommonController {

    @ResponseBody
    @RequestMapping(value = "uploadFileProduct", method = RequestMethod.POST)
    public Responsedto uploadFileProduct(@RequestParam(name = "file", required = false) MultipartFile file){
        try {
            String fileName = FileUntils.saveFileProduct(file);
            Responsedto responsedto = new Responsedto(1, fileName);
            return responsedto;
        }catch (Exception e){
            e.printStackTrace();
        }
            Responsedto responsedto = new Responsedto(0, file.getOriginalFilename());
            return  responsedto;
    }

    @ResponseBody
    @RequestMapping(value = "uploadFileCategory", method = RequestMethod.POST)
    public Responsedto uploadFileCategory(@RequestParam(name = "file", required = false) MultipartFile file){
        try {
            String fileName = FileUntils.saveFileCategory(file);
            Responsedto responsedto = new Responsedto(1, fileName);
            return responsedto;
        }catch (Exception e){
            e.printStackTrace();
        }
        Responsedto responsedto = new Responsedto(0, file.getOriginalFilename());
        return  responsedto;
    }

    @ResponseBody
    @RequestMapping(value = "uploadFileUser", method = RequestMethod.POST)
    public Responsedto uploadFileUser(@RequestParam(name = "file", required = false) MultipartFile file){
        try {
            String fileName = FileUntils.saveFileUser(file);
            Responsedto responsedto = new Responsedto(1, fileName);
            return responsedto;
        }catch (Exception e){
            e.printStackTrace();
        }
        Responsedto responsedto = new Responsedto(0, file.getOriginalFilename());
        return  responsedto;
    }
}
