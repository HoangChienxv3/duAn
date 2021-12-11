package com.mamilove.service.service;

import java.util.List;

import com.mamilove.entity.Size;
import com.mamilove.entity.Typesize;
import com.mamilove.request.dto.SizeRequest;

public interface SizeService {
    List<Size> findAll();

    List<Size> findByTypeSize(Typesize typeSize);
    
    List<Size> findAllByIsDeleteFalse();

    List<Size> saveAll(List<Size> size);

    void deleteInBatch(List<Size> size);

    Size create(SizeRequest sizeRequest);

    Size update(Long idsize, SizeRequest sizeRequest);

    Size delete(Long idsize);
}
