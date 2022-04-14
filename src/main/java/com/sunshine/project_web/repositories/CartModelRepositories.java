package com.sunshine.project_web.repositories;

import com.sunshine.project_web.dto.CartModelDto;
import com.sunshine.project_web.entities.CartmodelEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

public interface CartModelRepositories extends JpaRepository<CartmodelEntity, Long> {

    @Query(value = "SELECT * FROM cartmodel p WHERE p.userid = ?1", nativeQuery = true)
    List<CartmodelEntity> listCart(Long userId);

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM cartmodel WHERE userid = ?1", nativeQuery = true)
    void deleteByUserid(Long userId);

    @Transactional
    @Modifying
    @Query(value = "UPDATE cartmodel p SET p.number = ?1 WHERE p.userid = ?2 AND p.id = ?3 ", nativeQuery = true)
    void updateByUserid(Integer number, Long userId, Long id);



}
