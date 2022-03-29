package com.sunshine.project_web.service;

import com.sunshine.project_web.dto.UserDetailCustom;
import com.sunshine.project_web.entities.UserEntity;
import com.sunshine.project_web.repositories.UserRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class UserDetailServiceImp implements UserDetailsService {
    @Autowired
    UserRepositories userRepositories;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity userEntity = userRepositories.findFirstByUsername(username);
        if (userEntity == null){
            throw new UsernameNotFoundException("Không tìm thấy User");
        }else {
            Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
            grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_"+ userEntity.getPermissions()));

            UserDetailCustom userDetailCustom = new UserDetailCustom(userEntity.getUsername(), userEntity.getPasswd(), grantedAuthorities);
            userDetailCustom.setEmail(userEntity.getEmail());
            userDetailCustom.setAvarta(userEntity.getAvatar());
            userDetailCustom.setId(userEntity.getId());
            return userDetailCustom;
        }
    }
}
