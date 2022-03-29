package com.sunshine.project_web.dto;

import com.sunshine.project_web.entities.CategoryEntity;
import com.sunshine.project_web.entities.ProductEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryDto {
    Long id;
    String name;
    String img;

    public CategoryEntity mapperEntities(){
        CategoryEntity categoryEntity = new CategoryEntity();
        categoryEntity.setId(id);
        categoryEntity.setName(name);
        categoryEntity.setImg(img);
        return categoryEntity;
    }
}
