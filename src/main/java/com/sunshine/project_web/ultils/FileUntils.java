package com.sunshine.project_web.ultils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FileUntils {

    public static String PATH_IMG_Product = "C:\\Users\\User\\Pictures\\Product_Web\\";
    public static String PATH_IMG_User = "C:\\Users\\User\\Pictures\\User_Web\\";
    public static String PATH_IMG_Category = "C:\\Users\\User\\Pictures\\Category_Web\\";
    public static String saveFileProduct(MultipartFile file) {
        File foder = new File(PATH_IMG_Product);
        if(!foder.exists()){
            foder.mkdir();
        }
        Path path = Paths.get(PATH_IMG_Product);
        try {
            String fileName = System.currentTimeMillis() + file.getOriginalFilename(); // System.currentTimeMillis(): tạo một dãy số ngẫu nhiên trước nó, cụ thể là lấy theo thời gian.
//            String fileName = file.getOriginalFilename();
            Files.copy(file.getInputStream(), path.resolve(fileName));
            return fileName;
        } catch (Exception e) {
            throw new RuntimeException("Could not store the file. Error: " + e.getMessage());
        }
    }

    public static String saveFileUser(MultipartFile file) {
        File foder = new File(PATH_IMG_User);
        if(!foder.exists()){
            foder.mkdir();
        }
        Path path = Paths.get(PATH_IMG_User);
        try {
            String fileName = System.currentTimeMillis() + file.getOriginalFilename(); // System.currentTimeMillis(): tạo một dãy số ngẫu nhiên trước nó, cụ thể là lấy theo thời gian.
//            String fileName = file.getOriginalFilename();
            Files.copy(file.getInputStream(), path.resolve(fileName));
            return fileName;
        } catch (Exception e) {
            throw new RuntimeException("Could not store the file. Error: " + e.getMessage());
        }
    }

    public static String saveFileCategory(MultipartFile file) {
        File foder = new File(PATH_IMG_Category);
        if(!foder.exists()){
            foder.mkdir();
        }
        Path path = Paths.get(PATH_IMG_Category);
        try {
            String fileName = System.currentTimeMillis() + file.getOriginalFilename(); // System.currentTimeMillis(): tạo một dãy số ngẫu nhiên trước nó, cụ thể là lấy theo thời gian.
//            String fileName = file.getOriginalFilename();
            Files.copy(file.getInputStream(), path.resolve(fileName));
            return fileName;
        } catch (Exception e) {
            throw new RuntimeException("Could not store the file. Error: " + e.getMessage());
        }
    }



}
