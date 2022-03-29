package com.sunshine.project_web.service;

import com.sunshine.project_web.dto.ProductDto;
import com.sunshine.project_web.entities.ProductEntity;
import com.sunshine.project_web.paging.PagingObject;
import com.sunshine.project_web.repositories.ProductRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService implements TableService {
    @Autowired
    ProductRepositories productRepositories;

    public boolean save(ProductDto productDto){
        boolean result = false;
        try {
            productRepositories.save(productDto.mapperEntities());
            result = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public void findAll(PagingObject page) {
        page.findAll(productRepositories);
    }

    public ProductEntity detailProduct(String id){
        ProductEntity productEntity = new ProductEntity();
        productEntity = productRepositories.detailProduct(id);
        return productEntity;
    }

    public boolean deleteProduct(Long id){
        boolean result = false;
        try {
            productRepositories.deleteById(id);
            result = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    public ProductEntity detailPrice(){
        ProductEntity productEntity = new ProductEntity();
        productEntity = productRepositories.detailProductPrice();
        return productEntity;
    }

    public List<ProductEntity> listDucati(){
        List<ProductEntity> productEntityList = new ArrayList<>();
        productEntityList = productRepositories.listDucati();
        return productEntityList;
    }
//        public Long count(){
//        Long count =productRepositories.count();
//            return count;
//        }
//    public List<ProductEntity> listLatestProduct(){
//        Long count = productRepositories.count();
//        List<ProductEntity> productEntityList = new ArrayList<>();
//        productEntityList = productRepositories.listProduct(count);
//        return productEntityList;
//    }
    public List<ProductEntity> listLatestProduct() {
        List<ProductEntity> productEntityList = new ArrayList<>();
        productEntityList = productRepositories.listLatestProduct();
        return productEntityList;
    }
}
