package com.mamilove.request.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductDto {
    private String name;
    private Double price;//giá gốc
    private Double discount;//giảm %
    private String description;//mô tả
    private String descriptionDetail;//mô tả chi tiết
    private String status;//trạng thái
    private Date day_update;
    private String image;//hình ảnh
    private Boolean isDelete = false;
    private  Long idcategorydetail;
}
