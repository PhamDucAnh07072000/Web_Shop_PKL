package com.sunshine.project_web.service;

import com.sunshine.project_web.dto.ProductDto;
import com.sunshine.project_web.dto.UserDto;
import com.sunshine.project_web.entities.ProductEntity;
import com.sunshine.project_web.entities.UserEntity;
import com.sunshine.project_web.paging.PagingObject;
import com.sunshine.project_web.repositories.UserRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.UsesSunHttpServer;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService implements TableService {

    @Autowired
    UserRepositories userRepositories;

    @Autowired
    PasswordEncoder passwordEncoder;

    public boolean save(UserDto userDto){
        boolean result = false;
        UserEntity userEntity = userDto.mappingEntities();
        userEntity.setPasswd(passwordEncoder.encode(userDto.getPasswd()));
        try {
            userRepositories.save(userEntity);
            result = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public void findAll(PagingObject page) {
        page.findAll(userRepositories);
    }

    public UserEntity detailUser(String id){
        UserEntity userEntity = new UserEntity();
        userEntity = userRepositories.detailUser(id);
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
}
