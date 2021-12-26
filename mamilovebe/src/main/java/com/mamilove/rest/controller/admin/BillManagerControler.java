package com.mamilove.rest.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.common.EnumRefund;
import com.mamilove.dao.BillDao;
import com.mamilove.entity.Bill;
import com.mamilove.response.dto.Res;
import com.mamilove.request.dto.ShipingRequest;
import com.mamilove.service.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.mail.MessagingException;

@CrossOrigin("http://localhost:4200/")
@RestController
@RequestMapping("/Manager/BillManagerController")
public class BillManagerControler {

    @Autowired
    BillDao billDao;

    @Autowired
    BillService billService;

    //lấy tất cả đơn hàng
    @GetMapping("/findAllByIsDeleteFalse")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<?> getAllBill() {
        return ResponseEntity.ok(new Res(billDao.findAll(), "Thành công", true));
    }

    @GetMapping("/cancel/{idbill}")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> cancelBill(@PathVariable("idbill") String idbill) throws MessagingException, UnsupportedEncodingException {
        return ResponseEntity.ok(new Res(billService.cancelBillManager(idbill), "Save success", true));
    }

    @GetMapping("/confirm/{idbill}")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> confirmBill(@PathVariable("idbill") String idbill) throws MessagingException, UnsupportedEncodingException {
        return ResponseEntity.ok(new Res(billService.confirmBillManager(idbill), "Save success", true));
    }

    @GetMapping("/ship/{idbill}")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> shipBill(@PathVariable("idbill") String idbill) throws MessagingException, UnsupportedEncodingException {
        return ResponseEntity.ok(new Res(billService.shipBillManager(idbill), "Save success", true));
    }

    @GetMapping("/received/{idbill}")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> receivedBill(@PathVariable("idbill") String idbill) {
        return ResponseEntity.ok(new Res(billService.receivedBillManager(idbill), "Save success", true));
    }

    @GetMapping("/refund/{idbill}")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> refundBill(@PathVariable("idbill") String idbill,
                                          @RequestParam(value = "status", required = false) EnumRefund status,
                                          @RequestParam(value = "note", required = false) String note) throws MessagingException, UnsupportedEncodingException {
        return ResponseEntity.ok(new Res(billService.refundBillManager(idbill, status, note), "Save success", true));
    }

    //thông tin đơn hàng bên vận chuyển
    @PostMapping("/shiping")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> shipingBill(@RequestBody ShipingRequest shipingRequest) {
        return ResponseEntity.ok(new Res(billService.shipingBill(shipingRequest), "Save success", true));
    }

    @GetMapping("/shiping/{idBill}")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> shipingBill(@PathVariable("idBill") String idBill) throws IOException {
        return ResponseEntity.ok(new Res(billService.getShipingBill(idBill), "Save success", true));
    }

    @PostMapping("/updateInline")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<?> updateInline(@RequestParam(required = false, value = "createdItems") String createdItems,
                                          @RequestParam(required = false, value = "updatedItems") String updatedItems,
                                          @RequestParam(required = false, value = "deletedItems") String deletedItems) {
        try {
            ObjectMapper json = new ObjectMapper();
            List<Bill> created;
            List<Bill> updated;
            List<Bill> deleted;

            created = Arrays.asList(json.readValue(createdItems, Bill[].class));
            updated = Arrays.asList(json.readValue(updatedItems, Bill[].class));
            deleted = Arrays.asList(json.readValue(deletedItems, Bill[].class));

            if (created.size() > 0) {
                for (Bill entity : created) {
                    entity.setIsDelete(false);
                }
                billDao.saveAll(created);
            }
            if (updated.size() > 0) {
                for (Bill entity : created) {
                    entity.setIsDelete(false);
                }
                billDao.saveAll(updated);
            }
            if (deleted.size() > 0) {
                for (Bill entity : deleted) {
                    entity.setIsDelete(true);
                }
                billDao.saveAll(deleted);
//				categoryDetailService.deleteInBatch(deleted);
            }
            return ResponseEntity.ok(new Res(billDao.findAll(), "Save success", true));
        } catch (Exception e) {
            // TODO: handle exception
            return ResponseEntity.ok(new Res("Save failed", false));
        }
    }
}
