package com.mamilove.request.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.mamilove.entity.Categorydetail;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class CategoryRequest {

    private String name;
    @Column(name = "isDelete")
    private Boolean isDelete = false;
    List<Categorydetail> categorydetails;

}
