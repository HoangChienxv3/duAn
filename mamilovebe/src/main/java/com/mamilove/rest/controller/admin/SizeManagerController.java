package com.mamilove.rest.controller.admin;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import com.mamilove.request.dto.SizeRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.entity.Size;
import com.mamilove.entity.Typesize;
import com.mamilove.response.dto.Res;
import com.mamilove.service.service.SizeService;
import com.mamilove.service.service.TypeSizeService;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Manager/SizeManagerController")
public class SizeManagerController {
    @Autowired
    SizeService sizeService;
    @Autowired
    TypeSizeService typeService;

    @GetMapping("/findAll")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<?> findAll() {
        return ResponseEntity.ok(new Res(sizeService.findAll(), "OK", true));
    }

    @PostMapping("/findByTypeSize")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<?> findByTypeSize(@RequestBody String id) {
        long l = Long.parseLong(id);
        Optional<Typesize> entity = Optional.ofNullable(typeService.findById(l).get());
        List<Size> list = sizeService.findByTypeSize(entity.get());
        return ResponseEntity.ok(new Res(list, "OK", true));
    }

    @PostMapping("/updateInline")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<?> updateInline(@RequestParam(required = false, value = "createdItems") String createdItems,
                                          @RequestParam(required = false, value = "updatedItems") String updatedItems,
                                          @RequestParam(required = false, value = "deletedItems") String deletedItems) {
        try {
            ObjectMapper json = new ObjectMapper();
            List<Size> created;
            List<Size> updated;
            List<Size> deleted;

            created = Arrays.asList(json.readValue(createdItems, Size[].class));
            updated = Arrays.asList(json.readValue(updatedItems, Size[].class));
            deleted = Arrays.asList(json.readValue(deletedItems, Size[].class));

            if (created.size() > 0) {
                for (Size entity : created) {
                    entity.setIsDelete(false);
                }
                sizeService.saveAll(created);
            }
            if (updated.size() > 0) {
                for (Size entity : updated) {
                    entity.setIsDelete(false);
                }
                sizeService.saveAll(updated);
            }
            if (deleted.size() > 0) {
                for (Size entity : deleted) {
                    entity.setIsDelete(true);
                }
                sizeService.saveAll(deleted);
//				sizeService.deleteInBatch(deleted);
            }
            return ResponseEntity.ok(new Res(sizeService.findAll(), "Save success", true));
        } catch (Exception e) {
            // TODO: handle exception
            return ResponseEntity.ok(new Res("Save failed", false));
        }
    }

    //code chien
    @PostMapping("/create")
    public ResponseEntity<Res> createSize(@RequestBody SizeRequest sizeRequest) {
        return ResponseEntity.ok(new Res(sizeService.create(sizeRequest), "Đã thêm thành công", true));
    }

    @PostMapping("/update/{idsize}")
    public ResponseEntity<Res> updateSize(@PathVariable("idsize") Long idsize, @RequestBody SizeRequest sizeRequest) {
        return ResponseEntity.ok(new Res(sizeService.update(idsize, sizeRequest), "Đã update thành công", true));
    }

    @PostMapping("/dalete/{idsize}")
    public ResponseEntity<Res> daleteSize(@PathVariable("idsize") Long idsize) {
        return ResponseEntity.ok(new Res(sizeService.delete(idsize), "Đã update thành công", true));
    }
}
