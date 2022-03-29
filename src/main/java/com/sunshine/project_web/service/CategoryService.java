package com.sunshine.project_web.service;

import com.sunshine.project_web.dto.CategoryDto;
import com.sunshine.project_web.dto.ProductDto;
import com.sunshine.project_web.entities.CategoryEntity;
import com.sunshine.project_web.entities.ProductEntity;
import com.sunshine.project_web.paging.PagingObject;
import com.sunshine.project_web.repositories.CategoryRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryService implements TableService {

    @Autowired
    CategoryRepositories categoryRepositories;

    public boolean save(CategoryDto categoryDto){
        boolean result = false;
        try {
            categoryRepositories.save(categoryDto.mapperEntities());
            result = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public void findAll(PagingObject page) {
        page.findAll(categoryRepositories);
    }

   public CategoryEntity detailCategory(Long id){
        CategoryEntity categoryEntity = new CategoryEntity();
        categoryEntity = categoryRepositories.detailCategory(id);
        return categoryEntity;
   }
    public boolean deleteProduct(Long id){
        boolean result = false;
        try {
            categoryRepositories.deleteById(id);
            result = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    public List<CategoryEntity> findAllCategory(){
        List<CategoryEntity> categoryEntityList = new ArrayList<>();
        categoryEntityList = categoryRepositories.FindAllCategory();
        return categoryEntityList;
    }
}
