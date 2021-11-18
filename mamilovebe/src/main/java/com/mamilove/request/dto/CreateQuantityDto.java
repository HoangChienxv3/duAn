package com.mamilove.request.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateQuantityDto {
    private Long idpoduct;
    private Long idsize;
    private List<Propertyrequest> propertyrequests;
}
