package com.mamilove.rest.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.entity.Event;
import com.mamilove.request.dto.EventDto;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin/event")
public class EventController {
    @Autowired
    ObjectMapper objectMapper;
    @Autowired
    EventService eventService;

    @GetMapping("/all")
    public ResponseEntity<?> getAll() {
        List<Event> event = eventService.findAllFalse();
        return ResponseEntity.ok(new Res(event, "success", true));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Res> getDetail(@PathVariable("id") Long id) {
        Event even = eventService.findById(id);
        if (even.getIsDelete() == true) {
            return ResponseEntity.ok(new Res(null, "Đã bị xóa", false));
        }
        return ResponseEntity.ok(new Res(even, "success", true));
    }

    @PostMapping("/create")
    public ResponseEntity<?> create(@RequestBody EventDto event) {
        Event ev = objectMapper.convertValue(event, Event.class);
        Event even = eventService.create(ev);
        return ResponseEntity.ok(new Res(even, "dat", true));
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<?> update(@PathVariable("id") Long id, @RequestBody EventDto event) {
        Event evens = eventService.findById(id);
        if (evens.getIsDelete() == true) {
            return ResponseEntity.ok(new Res(null, "Đã bị xóa update lỗi", false));
        }
        Event ev = objectMapper.convertValue(event, Event.class);
        ev.setId(id);
        Event even = eventService.create(ev);
        return ResponseEntity.ok(new Res(even, "update thành công", true));
    }

    @PutMapping("/delete/{id}")
    public ResponseEntity<Res> delete(@PathVariable("id") Long id) {
        Event ev = eventService.findById(id);
        if (ev != null) {
            ev.setIsDelete(true);
        }
        Event even = eventService.create(ev);
        return ResponseEntity.ok(new Res(even, "xóa thành công", true));
    }
}
