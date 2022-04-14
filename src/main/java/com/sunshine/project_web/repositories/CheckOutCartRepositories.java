package com.sunshine.project_web.repositories;

import com.sunshine.project_web.entities.CartmodelEntity;
import com.sunshine.project_web.entities.CheckoutcartEntity;
import com.sunshine.project_web.entities.ProductEntity;
import com.sunshine.project_web.entities.UserEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface CheckOutCartRepositories extends SearchingRepositories<CheckoutcartEntity, Long> {

    @Query(value = "SELECT * FROM checkoutcart p WHERE p.userid = ?1", nativeQuery = true)
    List<CheckoutcartEntity> listCheckOut(Long userId);

    @Transactional
    @Modifying
    @Query(value = "UPDATE checkoutcart p SET p.status = ?1 WHERE p.id = ?2 ", nativeQuery = true)
    void updateCheckOut(Integer status, Long id);

//    Đây là câu tìm kiếm em viết theo Mysql nhưng cái Page nó đang ko trả được kết quả
//SELECT username, email, name, number, productimg, status FROM
//    SELECT u.username, u.email, c.productid, c.number, c.productimg, c.status  FROM checkoutcart c JOIN user u on c.userid = u.id  JOIN product p on c.productid = p.id WHERE u.username LIKE '%?1%'
//    @Query(value = "SELECT * FROM (SELECT username, email, name, number, productimg, status " +
//            "FROM (SELECT username, email, productid, number, productimg, status  " +
//            "FROM checkoutcart c LEFT JOIN user u on c.userid = u.id) AS a " +
//            "LEFT JOIN product p on a.productid = p.id) AS B WHERE B.username LIKE %?1%",  nativeQuery = true )
    // Rồi đấy e thử xem
    @Query(value = "select c from CheckoutcartEntity c  join c.userEntity u join c.productEntity p " +
            " where ?1 is null or u.username like %?1% or u.email like %?1%")
    Page<CheckoutcartEntity> findAll(String keyWord, Pageable pageable);
}
