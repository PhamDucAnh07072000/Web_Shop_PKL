package com.sunshine.project_web.repositories;

import com.sunshine.project_web.entities.ProductEntity;
import com.sunshine.project_web.entities.UserEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface UserRepositories extends SearchingRepositories<UserEntity, Long> {

    @Query(value = "SELECT * FROM user p WHERE p.id =?1", nativeQuery = true)
    UserEntity detailUser(String id);

    @Query(value = "SELECT * FROM user p WHERE permissions = 'ADMIN' ", nativeQuery = true)
    List<UserEntity> detailAdmin();

    UserEntity findFirstByUsername(String userName);

    @Query(value = "SELECT * FROM user p WHERE p.username LIKE %?1% or p.email LIKE %?1% or p.phone LIKE %?1% or p.permissions LIKE %?1% ",  nativeQuery = true )
    Page<UserEntity> findAll(String keyWord, Pageable pageable);

    @Transactional
    @Modifying
    @Query(value = "UPDATE user p SET p.passwd = ?1 WHERE p.id = ?2 ", nativeQuery = true)
    void updatePassWord(String passwd, Long id);


}
