package com.sunshine.project_web.paging;

import com.sunshine.project_web.repositories.CheckOutCartRepositories;
import com.sunshine.project_web.repositories.ProductRepositories;
import com.sunshine.project_web.repositories.SearchingRepositories;
import com.sunshine.project_web.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.util.StringUtils;
import org.springframework.web.method.support.ModelAndViewContainer;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PagingObject {

    private Integer page = 1;
    private Integer perpage = 6;
    private String sort;
    private String keyWord;
    private String path;
    private String field;
    private String brand;
    private String start;
    private String end;
    private ModelAndViewContainer model;


    public void findAll(JpaRepository<?, Long> repository){
        Sort sortPage = null;
        if(!StringUtils.isEmpty(field)){
            sortPage = Sort.by(field);
            if ("asc".equals(sort)){
                sortPage = sortPage.ascending();
            }else {
                sortPage = sortPage.descending();
            }
        }
        Page<?> result = null;
        if(repository instanceof SearchingRepositories && !StringUtils.isEmpty(keyWord)){
            result = ((SearchingRepositories)repository).findAll(keyWord, PageRequest.of(page - 1, perpage, sortPage));
        }
        else if (repository instanceof ProductRepositories && !StringUtils.isEmpty(brand)){
            result = ((ProductRepositories)repository).findCategoryProduct(brand, PageRequest.of(page - 1, perpage, sortPage) );
        }
        else if (repository instanceof ProductRepositories && !StringUtils.isEmpty(start) && !StringUtils.isEmpty(end)){
            result = ((ProductRepositories)repository).listPriceProduct(start, end, PageRequest.of(page - 1, perpage, sortPage));
        }
        else {
            result = repository.findAll(PageRequest.of(page - 1, perpage, sortPage));
        }

        model.addAttribute("data", result.getContent());
        model.addAttribute("page", page);
        model.addAttribute("perpage", perpage);
        model.addAttribute("field", field);
        model.addAttribute("sort", sort);
        model.addAttribute("path", path);
        model.addAttribute("brand", brand);
        model.addAttribute("start", start);
        model.addAttribute("end", end);
        model.addAttribute("keyWord", keyWord);
        model.addAttribute("totalPage", result.getTotalPages());
    }
}
