package com.sunshine.project_web.repositories;

import com.sunshine.project_web.entities.ProductEntity;
import com.sunshine.project_web.entities.UserEntity;
import org.hibernate.metamodel.model.convert.spi.JpaAttributeConverter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepositories extends JpaRepository<UserEntity, Long> {

    @Query(value = "SELECT * FROM user p WHERE p.id =?1", nativeQuery = true)
    UserEntity detailUser(String id);

    UserEntity findFirstByUsername(String userName);

}
