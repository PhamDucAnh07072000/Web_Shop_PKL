package com.sunshine.project_web.service;


import com.sunshine.project_web.dto.CartModelDto;
import com.sunshine.project_web.entities.CartmodelEntity;
import com.sunshine.project_web.repositories.CartModelRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CartModelService {
    @Autowired
    CartModelRepositories cartModelRepositories;

    public void saveCart(CartModelDto cartModelDto){
        cartModelRepositories.save(cartModelDto.mapperEntities());
    }

    public List<CartmodelEntity> cartList(Long userId){
        List<CartmodelEntity> cartmodelEntity = new ArrayList<>();
        cartmodelEntity = cartModelRepositories.listCart(userId);
        return cartmodelEntity;
    }

    public void deleteCart(Long userId){
        cartModelRepositories.deleteByUserid(userId);
    }

    public void updateCart(CartModelDto cartmodel, Long userId, Long id){
        cartModelRepositories.updateByUserid(cartmodel.getNumber(), userId, id);
    }
}
