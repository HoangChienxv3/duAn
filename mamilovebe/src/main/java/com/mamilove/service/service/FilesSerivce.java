package com.mamilove.service.service;


import java.nio.file.Path;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

import com.mamilove.entity.Image;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

public interface FilesSerivce {
    void init();

    void save(MultipartFile file);

    Resource load(String filename);

    Image  saveDt(Image img);
    Stream<Path> loadAll();
    ResponseEntity get(String filename);
    List<Image> ListImagesByProduct(Long idProduct);
    Image saveAndFlush(Image image);
    Optional<Image> findById(Long id);
}
