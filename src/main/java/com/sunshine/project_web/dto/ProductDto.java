package com.sunshine.project_web.dto;

import com.sunshine.project_web.entities.ProductEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {
    private Long id;
    private String name;
    private Double price;
    private String brand;
    private String img;
    private String descriptions;

    public ProductEntity mapperEntities(){
        ProductEntity productEntity = new ProductEntity();
        productEntity.setId(id);
        productEntity.setName(name);
        productEntity.setPrice(price);
        productEntity.setBrand(brand);
        productEntity.setImg(img);
        productEntity.setDescriptions(descriptions);
        return productEntity;
    }
}
