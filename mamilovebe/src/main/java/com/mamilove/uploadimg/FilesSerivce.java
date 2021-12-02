package com.mamilove.uploadimg;


import java.nio.file.Path;
import java.util.List;
import java.util.stream.Stream;

import com.mamilove.entity.Image;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

public interface FilesSerivce {
    public void init();

    public void save(MultipartFile file);

    public Resource load(String filename);

    public void deleteAll();
     Image  saveDt(Image img);
    public Stream<Path> loadAll();
    public ResponseEntity get(String filename);
    List<Image> ListImagesByProduct(Long idProduct);
     List<Image> findAll();
}
