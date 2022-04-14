package com.sunshine.project_web.dto;

import com.sunshine.project_web.entities.ProductEntity;
import com.sunshine.project_web.entities.UserEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
    private Long id;
    private String userName;
    private String email;
    private String passwd;
    private String descriptions;
    private Long phone;
    private String avatar;
    private String permissions;

   public UserEntity mapperEntities(){
       UserEntity userEntity = new UserEntity();
       userEntity.setId(id);
       userEntity.setUsername(userName);
       userEntity.setEmail(email);
       userEntity.setPasswd(passwd);
       userEntity.setDescriptions(descriptions);
       userEntity.setPhone(phone);
       userEntity.setAvatar(avatar);
       userEntity.setPermissions(permissions);
       return userEntity;
   }
}
