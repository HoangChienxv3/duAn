package com.mamilove.uploadimg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
@RestController
@CrossOrigin("http://localhost:8081")
@RequestMapping("manager/image")
public class RestUploatImgController {

    @Autowired
    FilesSerivce storageService;

    @PostMapping("/upload")
    public ResponseEntity<ResponeMess> uploadFiles(@RequestParam("files") MultipartFile[] files) {
        String message = "";
        try {
            List<String> fileNames = new ArrayList<>();

            Arrays.asList(files).stream().forEach(file -> {
                storageService.save(file);
                fileNames.add(file.getOriginalFilename());
            });

            message = "Tải các tệp ảnh thành công: " + fileNames;
            //sử lý khi thêm ảnh thành công thêm ảnh vào đb + fileNames;
            // Lấy tên ảnh từ mutipart sau khi thêm theo dạng list
            // file name là tên ảnh
            return ResponseEntity.status(HttpStatus.OK).body(new ResponeMess(message));
        } catch (Exception e) {
            message = "Tải các tệp ảnh không thành công!";
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponeMess(message));
        }
    }
   //lấy thông tin của file ảnh trong mutipath
    @GetMapping("/files")
    public ResponseEntity<List<FileInfo>> getListFiles() {
        List<FileInfo> fileInfos = storageService.loadAll().map(path -> {
            String filename = path.getFileName().toString();
            String url = MvcUriComponentsBuilder
                    .fromMethodName(RestUploatImgController.class, "getFile", path.getFileName().toString()).build().toString();

            return new FileInfo(filename, url);
        }).collect(Collectors.toList());

        return ResponseEntity.status(HttpStatus.OK).body(fileInfos);
    }
   // lấy thông tin của một file ảnh
    @GetMapping("/files/{filename:.+}")
    public ResponseEntity<Resource> getFile(@PathVariable String filename) {
        Resource file = storageService.load(filename);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"").body(file);
    }
    //Hiện thị ảnh từ mutipath lên trên localhost
    @GetMapping("/get/{fileName}")
    public ResponseEntity get(@PathVariable("fileName") String fileName) {
        return storageService.get(fileName);
    }
}
