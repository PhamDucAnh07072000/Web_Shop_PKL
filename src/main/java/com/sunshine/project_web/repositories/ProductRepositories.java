package com.sunshine.project_web.repositories;

import ch.qos.logback.core.boolex.EvaluationException;
import com.sunshine.project_web.entities.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepositories extends JpaRepository<ProductEntity, Long> {

    @Query(value = "SELECT * FROM product p WHERE p.id =?1", nativeQuery = true)
    ProductEntity detailProduct(String id);

    @Query(value = "SELECT * FROM product p ORDER BY price DESC LIMIT 1", nativeQuery = true)
    ProductEntity detailProductPrice();

    @Query(value = "SELECT * FROM product p WHERE brand = 'Ducati' ORDER BY id DESC LIMIT 3", nativeQuery = true)
    List<ProductEntity> listDucati();

//    @Query(value = "SELECT * FROM product p LIMIT" , nativeQuery = true)
//    List<ProductEntity> listProduct(Long count);

    @Query(value = "SELECT * FROM product p ORDER BY id DESC LIMIT 6", nativeQuery = true)
    List<ProductEntity> listLatestProduct();
}
