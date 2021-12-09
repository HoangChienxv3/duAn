package com.mamilove.rest.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.dao.EventDao;
import com.mamilove.entity.Event;
import com.mamilove.entity.Property;
import com.mamilove.request.dto.EventRequest;
import com.mamilove.response.dto.Res;
import com.mamilove.service.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@CrossOrigin("http://localhost:4200/")
@RestController
@RequestMapping("/Manager/EventManagerController")
public class EventManagerController {

    @Autowired
    EventService eventService;
    @Autowired
    EventDao eventDAO;

    @PostMapping("/create")
    public ResponseEntity<Res> cteateEvent(@RequestBody EventRequest eventRequest) throws ParseException {
        return ResponseEntity.ok(new Res(eventService.create(eventRequest), "Thêm thành công", true));
    }

    @PostMapping("/update/{id}")
    public ResponseEntity<Res> updateEvent(@PathVariable("id") Long id, @RequestBody EventRequest eventRequest) throws ParseException {
        return ResponseEntity.ok(new Res(eventService.update(id, eventRequest), "Thêm thành công", true));
    }

    @GetMapping("/detele/{id}")
    public ResponseEntity<Res> deteleEvent(@PathVariable("id") Long id) {
        return ResponseEntity.ok(new Res(eventService.detele(id), "Xóa thành công", true));
    }

    @GetMapping("/findAll")
    public ResponseEntity<Res> findAll() {
        return ResponseEntity.ok(new Res(eventService.findAll(), "thành công", true));
    }

    @GetMapping("/get/{id}")
    public ResponseEntity<Res> findById(@PathVariable("id") Long id) {
        return ResponseEntity.ok(new Res(eventService.findById(id), "thành công", true));
    }
    
    @PostMapping("/updateInline")
    public ResponseEntity<?> updateInline(@RequestParam(required = false, value = "createdItems") String createdItems,
                                          @RequestParam(required = false, value = "updatedItems") String updatedItems,
                                          @RequestParam(required = false, value = "deletedItems") String deletedItems) throws IOException {
        try {
            ObjectMapper json = new ObjectMapper();
            List<Event> created = new ArrayList<>();
            List<Event> updated = new ArrayList<>();
            List<Event> deleted = new ArrayList<>();

            created = Arrays.asList(json.readValue(createdItems, Event[].class));
            updated = Arrays.asList(json.readValue(updatedItems, Event[].class));
            deleted = Arrays.asList(json.readValue(deletedItems, Event[].class));

            if (created.size() > 0) {
                for (Event entity : created) {
                    entity.setIsDelete(false);
                }
                eventDAO.saveAll(created);
            }
            if (updated.size() > 0) {
                for (Event entity : updated) {
                    entity.setIsDelete(false);
                }
                eventDAO.saveAll(updated);
            }
            if (deleted.size() > 0) {
                for (Event entity : deleted) {
                    entity.setIsDelete(true);
                }
                eventDAO.saveAll(deleted);
//				propertyService.deleteInBatch(deleted);
            }
            return ResponseEntity.ok(new Res(eventService.findAll(), "Save success", true));
        } catch (Exception e) {
            // TODO: handle exception
            return ResponseEntity.ok(new Res("Save failed", false));
        }
    }
}
