package com.sunshine.project_web.service;

import com.sunshine.project_web.dto.CheckOutCartDto;
import com.sunshine.project_web.entities.CheckoutcartEntity;
import com.sunshine.project_web.paging.PagingObject;
import com.sunshine.project_web.repositories.CheckOutCartRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CheckOutCartService implements TableService {

    @Autowired
    CheckOutCartRepositories checkOutCartRepositories;

    public void SaveCheckOutCart(CheckOutCartDto checkOutCartDto){
        checkOutCartRepositories.save(checkOutCartDto.mapperEntities());
    }

    public List<CheckoutcartEntity> listCheckOut(Long userId){
        List<CheckoutcartEntity> checkoutcartEntities = new ArrayList<>();
        checkoutcartEntities = checkOutCartRepositories.listCheckOut(userId);
        return checkoutcartEntities;
    }

    @Override
    public void findAll(PagingObject page) {
        page.findAll(checkOutCartRepositories);
    }

    public void updateCheckOut(CheckOutCartDto checkOutCartDto, Long id){
        checkOutCartRepositories.updateCheckOut(checkOutCartDto.getStatus(), id);
    }
}
