package com.mamilove.rest.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.entity.Event;
import com.mamilove.entity.Voucher;
import com.mamilove.request.dto.Res;
import com.mamilove.request.dto.VoucherDto;
import com.mamilove.service.service.EventService;
import com.mamilove.service.service.VoucherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin/voucher")
public class VoucherController {
    @Autowired
    ObjectMapper objectMapper;
    @Autowired
    VoucherService voucherService;
    @Autowired
    EventService eventService;

    @GetMapping("/all")
    public ResponseEntity<?> getAll() {
        List<Voucher> voucher = voucherService.findAllFalse();
        if (voucher.size() == 0) {
            return ResponseEntity.ok(new Res(null, "FindAll null", false));
        }
        return ResponseEntity.ok(new Res(voucher, "FindAll success", true));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Res> getDetail(@PathVariable("id") Long id) {
        Voucher voucher = voucherService.findById(id);
        if (voucher.getIsDelete() == true || voucher.getEvent().getIsDelete() == true) {
            return ResponseEntity.ok(new Res(null, "Đã bị xóa", false));
        }
        return ResponseEntity.ok(new Res(voucher, "FinById success", true));
    }

    @PostMapping("/create")
    public ResponseEntity<?> create(@RequestBody VoucherDto voucher) {
        Long ideven = voucher.getIdevent();
        Event even = eventService.findById(ideven);
        Voucher vc = new Voucher();
        vc.setAmount(voucher.getAmount());
        vc.setDescriptionvoucher(voucher.getDescriptionvoucher());
        vc.setDiscount(voucher.getDiscount());
        vc.setEvent(even);
        Voucher vouchers = voucherService.create(vc);
        return ResponseEntity.ok(new Res(vouchers, "Creatte success", true));
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<?> update(@PathVariable("id") Long id, @RequestBody VoucherDto voucher) {
        Long ideven = voucher.getIdevent();
        Event even = eventService.findById(ideven);
        Voucher vc = new Voucher();
        vc.setId(id);
        vc.setAmount(voucher.getAmount());
        vc.setDescriptionvoucher(voucher.getDescriptionvoucher());
        vc.setDiscount(voucher.getDiscount());
        vc.setEvent(even);
        Voucher vouchers = voucherService.create(vc);
        return ResponseEntity.ok(new Res(vouchers, "Update success", true));
    }

    @PutMapping("/delete/{id}")
    public ResponseEntity<Res> delete(@PathVariable("id") Long id) {
        Voucher voucher = voucherService.findById(id);
        if (voucher != null) {
            voucher.setIsDelete(true);
        }
        Voucher vouchers = voucherService.create(voucher);
        return ResponseEntity.ok(new Res(vouchers, "Delete success", true));
    }
}
