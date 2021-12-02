package com.mamilove.rest.controller.admin;

import com.mamilove.response.dto.Res;
import com.mamilove.service.impl.StatisServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Manager/StatisController")
public class StatisController {

    @Autowired
    StatisServiceImpl statisService;

    @GetMapping("/test")
    public ResponseEntity<Res> getEveryDayOfTheMonth(@RequestParam(value = "year", required = false) Integer year,
                                          @RequestParam(value = "month",required = false)Integer month) {
        return ResponseEntity.ok(new Res(statisService.revenueEveryDayOfTheMonth(year, month), "Thành công", true));
    }

}
