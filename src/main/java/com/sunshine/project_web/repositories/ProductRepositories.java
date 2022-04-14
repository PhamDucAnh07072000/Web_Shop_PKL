package com.sunshine.project_web.repositories;

import ch.qos.logback.core.boolex.EvaluationException;
import com.sunshine.project_web.entities.ProductEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepositories extends SearchingRepositories<ProductEntity, Long> {

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

    @Query(value = "SELECT * FROM product p WHERE p.name LIKE %?1% or p.brand LIKE %?1% or p.descriptions LIKE %?1%",  nativeQuery = true )
    Page<ProductEntity> findAll(String keyWord, Pageable pageable);

//    @Query(value = "SELECT * FROM product p WHERE p.brand = ?1 ", nativeQuery = true)
//    List<ProductEntity> listCategoryProduct(String brand);
    @Query(value = "SELECT * FROM product p WHERE p.brand = ?1 ", nativeQuery = true)
    Page<ProductEntity> findCategoryProduct(String brand, Pageable pageable);

    @Query(value = "SELECT * FROM product p WHERE p.price BETWEEN ?1 AND  ?2", nativeQuery = true)
    Page<ProductEntity> listPriceProduct(String start, String end, Pageable pageable );
}
