package com.sunshine.project_web.dto;

import com.sunshine.project_web.entities.CartmodelEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartModelDto {
    private Long id;
    private Integer number;
    private Long productId;
    private Long userId;
    private String productImg;

    public CartmodelEntity mapperEntities(){
        CartmodelEntity cartmodelEntity = new CartmodelEntity();
        cartmodelEntity.setId(id);
        cartmodelEntity.setNumber(number);
        cartmodelEntity.setProductid(productId);
        cartmodelEntity.setUserid(userId);
        cartmodelEntity.setProductimg(productImg);
        return cartmodelEntity;
    }
}
