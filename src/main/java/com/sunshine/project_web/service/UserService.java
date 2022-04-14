package com.sunshine.project_web.service;

import com.sunshine.project_web.dto.UserDetailCustom;
import com.sunshine.project_web.dto.UserDto;
import com.sunshine.project_web.entities.UserEntity;
import com.sunshine.project_web.paging.PagingObject;
import com.sunshine.project_web.repositories.UserRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService implements TableService {

    @Autowired
    UserRepositories userRepositories;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    EmailService emailService;

    public boolean save(UserDto userDto){
        boolean result = false;
        UserEntity userEntity = userDto.mapperEntities();
        try {
            if(userDto.getId() == null){
                userEntity.setPasswd(passwordEncoder.encode(userDto.getPasswd()));
                userRepositories.save(userEntity);
                result = true;
            }else {
                userRepositories.save(userEntity);
                result = true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

//    public boolean update(UserDto userDto){
//        boolean result = false;
//        UserEntity userEntity = userDto.mapperEntities();
//        try {
//            userRepositories.save(userEntity);
//            result = true;
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return result;
//    }

    @Override
    public void findAll(PagingObject page) {
        page.findAll(userRepositories);
    }

    public UserEntity detailUser(String id){
        UserEntity userEntity = new UserEntity();
        userEntity = userRepositories.detailUser(id);
        return userEntity;
    }

    public List<UserEntity> detailAdmin(){
        List<UserEntity> userEntity = new ArrayList<>();
        userEntity = userRepositories.detailAdmin();
        return userEntity;
    }



    public boolean deleteUser(Long id){
        boolean result = false;
        try {
            userRepositories.deleteById(id);
            result = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    public void sendMailUser(UserDto userDto){
        String title = "Xác nhận đổi mật khẩu";
        String content = "Click vào đây" + " http://localhost:8080/BackEnd/Email/verify/" + ((UserDetailCustom)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId() + "?passWord=" + passwordEncoder.encode(userDto.getPasswd()) + " để xác nhận đổi mật khẩu";

        emailService.sendMail(title, content, ((UserDetailCustom)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getEmail());
    }

    public void updatePassWord(String passWd, Long id){
        userRepositories.updatePassWord(passWd, id);
    }
}
