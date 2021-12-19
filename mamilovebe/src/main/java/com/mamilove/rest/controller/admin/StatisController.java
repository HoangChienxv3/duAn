package com.mamilove.rest.controller.admin;

import com.mamilove.common.EnumStatus;
import com.mamilove.request.dto.QtyByDayRequest;
import com.mamilove.response.dto.Res;
import com.mamilove.service.impl.StatisServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Description;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Manager/StatisController")
public class StatisController {

    @Autowired
    StatisServiceImpl statisService;

    @GetMapping("/getEveryDayOfTheMonth")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> getEveryDayOfTheMonth(@RequestParam(value = "year", required = false) Integer year,
                                                     @RequestParam(value = "month", required = false) Integer month,
                                                     @RequestParam(value = "status", required = false) EnumStatus status) {
        return ResponseEntity.ok(new Res(statisService.revenueEveryDayOfTheMonth(year, month, status), "Thành công", true));
    }

    @GetMapping("/getEveryMonthOfTheYear")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> getEveryMonthOfTheYear(@RequestParam(value = "year", required = false) Integer year,
                                                      @RequestParam(value = "status", required = false) EnumStatus status) {
        return ResponseEntity.ok(new Res(statisService.getEveryMonthOfTheYear(year, status), "Thành công", true));
    }

    @GetMapping("/getEveryYear")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> getEveryYear(@RequestParam(value = "status", required = false) EnumStatus status) {
        return ResponseEntity.ok(new Res(statisService.getEveryYear(status), "Thành công", true));
    }

    @Description(value = "thong ke so luong sp theo ngay")
    @GetMapping("/quantityByDay")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> getQuantityByDay(QtyByDayRequest qtyByDayRequest) {
        return ResponseEntity.ok(new Res(statisService.quantityByDay(qtyByDayRequest), "Thành công", true));
    }

    @Description(value = "thong ke so luong sp theo thang")
    @GetMapping("/quantityByMonth")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> getQuantityByMonth(@RequestParam("status")EnumStatus status) {
        return ResponseEntity.ok(new Res(statisService.quantityByMonth(status), "Thành công", true));
    }

    @Description(value = "thong ke so luong bill")
    @GetMapping("/bill-dashboard")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> getBillDashBoard() {
        return ResponseEntity.ok(new Res(statisService.getBillDashBoard(), "Thành công", true));
    }
}
