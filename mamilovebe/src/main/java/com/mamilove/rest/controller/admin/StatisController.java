package com.mamilove.rest.controller.admin;

import com.mamilove.response.dto.Res;
import com.mamilove.service.impl.StatisServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Manager/StatisController")
public class StatisController {

    @Autowired
    StatisServiceImpl statisService;

    @GetMapping("/getEveryDayOfTheMonth")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> getEveryDayOfTheMonth(@RequestParam(value = "year", required = false) Integer year,
                                                     @RequestParam(value = "month", required = false) Integer month) {
        return ResponseEntity.ok(new Res(statisService.revenueEveryDayOfTheMonth(year, month), "Thành công", true));
    }

    @GetMapping("/getEveryMonthOfTheYear")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> getEveryMonthOfTheYear(@RequestParam(value = "year", required = false) Integer year) {
        return ResponseEntity.ok(new Res(statisService.getEveryMonthOfTheYear(year), "Thành công", true));
    }

}
