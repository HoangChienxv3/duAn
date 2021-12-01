package com.mamilove.rest.controller.admin;

import com.mamilove.request.dto.EventRequest;
import com.mamilove.response.dto.Res;
import com.mamilove.service.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;

@CrossOrigin("http://localhost:4200/")
@RestController
@RequestMapping("/Manager/EventManagerController")
public class EventManagerController {

    @Autowired
    EventService eventService;

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
}
