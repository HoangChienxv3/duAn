package com.mamilove.request.dto;

import com.mamilove.entity.Typesize;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class SizeRequest {

    private String name;

    private Long idtypesize;

}
