package com.mamilove.request.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.mamilove.entity.Category;
import com.mamilove.entity.Product;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class CategoryDetailResquest {

    private Long id;

    private String name;

    private Boolean isDelete = false;

    private Category category;

    private List<Product> products;

}
