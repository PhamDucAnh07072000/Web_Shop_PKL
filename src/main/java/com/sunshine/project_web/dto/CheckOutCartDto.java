package com.sunshine.project_web.dto;

import com.sunshine.project_web.entities.CheckoutcartEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CheckOutCartDto {
    private Long id;
    private Integer number;
    private Long productId;
    private Long userId;
    private String productImg;
    private Integer status;

    public CheckoutcartEntity mapperEntities(){
        CheckoutcartEntity checkoutcartEntity = new CheckoutcartEntity();
        checkoutcartEntity.setId(id);
        checkoutcartEntity.setNumber(number);
        checkoutcartEntity.setProductid(productId);
        checkoutcartEntity.setUserid(userId);
        checkoutcartEntity.setProductimg(productImg);
        checkoutcartEntity.setStatus(status);
        return checkoutcartEntity;
    }
}
