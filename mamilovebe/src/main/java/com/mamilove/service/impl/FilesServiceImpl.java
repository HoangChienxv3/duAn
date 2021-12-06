package com.mamilove.service.impl;


import com.mamilove.dao.ImageDao;
import com.mamilove.entity.Image;
import com.mamilove.service.service.FilesSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.MediaTypeFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import javax.transaction.Transactional;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

@Service
public class FilesServiceImpl implements FilesSerivce {

    private final Path root = Paths.get("severImg");
    @Autowired
    ImageDao imgDao;

    @Override
    public void init() {
        try {
            if (root.toFile().isFile() && !root.toFile().isDirectory()) {
                Files.createDirectory(root);
            } else {
                //System.out.println("File da co");
            }
        } catch (IOException e) {
            throw new RuntimeException("Không thể khởi tạo thư mục để tải ảnh lên!");
        }
    }

    //luu anh
    @Override
    public void save(MultipartFile file) {
        try {
            Long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            System.out.println(date);
            Files.copy(file.getInputStream(), this.root.resolve("sp" + date + file.getOriginalFilename()));


        } catch (Exception e) {
            throw new RuntimeException("Không thể lưu trữ tệp. Error: " + e.getMessage());
        }
    }

    @Override
    public Resource load(String filename) {
        try {
            Path file = root.resolve(filename);
            Resource resource = new UrlResource(file.toUri());

            if (resource.exists() || resource.isReadable()) {
                return resource;
            } else {
                throw new RuntimeException("Không thể đọc tệp!");
            }
        } catch (MalformedURLException e) {
            throw new RuntimeException("Error: " + e.getMessage());
        }
    }


    public ResponseEntity get(String fileName) {
        Path path = root.resolve(fileName).normalize();
        try {
            Resource resource = new UrlResource(path.toUri());
            if (resource.exists()) {
                MediaType mediaType = MediaTypeFactory.getMediaType(fileName).get();
                return ResponseEntity
                        .ok()
                        .contentType(mediaType)
                        .body(resource);
            }
        } catch (MalformedURLException e) {
        }
        throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Loi roi");
    }

    @Override
    public Image saveDt(Image img) {
        return imgDao.save(img);
    }

    @Override
    public List<Image> ListImagesByProduct(Long idProduct) {
        return imgDao.ListImagesByProduct(idProduct);
    }

    @Override
    public Optional<Image> findById(Long id) {
        // TODO Auto-generated method stub
        return imgDao.findById(id);
    }

    @Override
    @Transactional
    public Image saveAndFlush(Image image) {
        // TODO Auto-generated method stub
        return imgDao.saveAndFlush(image);
    }

    @Override
    public Stream<Path> loadAll() {
        try {
            return Files.walk(this.root, 1).filter(path -> !path.equals(this.root)).map(this.root::relativize);
        } catch (IOException e) {
            throw new RuntimeException("Không thể tải các tệp!");
        }
    }
}

