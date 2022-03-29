package com.sunshine.project_web.paging;

import org.springframework.core.MethodParameter;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class PagingParamResolver implements HandlerMethodArgumentResolver {
    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        return parameter.getParameterAnnotation(PagingAnnotation.class) != null;
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        String path = parameter.getParameterAnnotation(PagingAnnotation.class).path();
        Integer page = 1;
        String pageStr = webRequest.getParameter("page");
        if(!StringUtils.isEmpty(pageStr)){
            page = Integer.valueOf(pageStr);
        }
        Integer perpage = 5;
        String perpageStr = webRequest.getParameter("perpage");
        if(!StringUtils.isEmpty(perpageStr)){
            perpage = Integer.valueOf(perpageStr);
        }
        String sort = webRequest.getParameter("sort");
        String keyWord = webRequest.getParameter("keyWord");
        String field = webRequest.getParameter("field");
        if (StringUtils.isEmpty(field)){
            field = "id";
        }
        return new PagingObject(page, perpage, sort, keyWord, path, field, mavContainer);
    }
}
