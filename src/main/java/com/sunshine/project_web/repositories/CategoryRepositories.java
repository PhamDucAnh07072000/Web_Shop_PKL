package com.sunshine.project_web.repositories;

import com.sunshine.project_web.entities.CategoryEntity;
import com.sunshine.project_web.entities.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CategoryRepositories extends JpaRepository<CategoryEntity, Long> {

    @Query(value = "SELECT * FROM category p where p.id =?1", nativeQuery = true)
    CategoryEntity detailCategory(Long id);

    @Query(value = "SELECT * FROM category p", nativeQuery = true)
    List<CategoryEntity> FindAllCategory();
}
