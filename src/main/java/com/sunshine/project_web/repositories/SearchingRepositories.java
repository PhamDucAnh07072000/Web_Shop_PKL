package com.sunshine.project_web.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

import java.util.List;

@NoRepositoryBean
public interface SearchingRepositories<T, ID> extends JpaRepository<T, ID> {

    Page<T> findAll(String keyWord, Pageable pageable);

//    Page<T> findCategoryProduct(String brand, Pageable pageable);// chỗ này e đang sai vì trong thằng usẻ repo e ko ovveride thằng này nó sẽ tự động hiểu là trong user có trường category


}
