package com.mamilove.rest.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.dao.BillDao;
import com.mamilove.entity.Bill;
import com.mamilove.entity.Voucher;
import com.mamilove.request.dto.Res;
import com.mamilove.request.dto.ShipingRequest;
import com.mamilove.service.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin("http://localhost:4200/")
@RestController
@RequestMapping("/Manager/BillManagerController")
public class BillManagerControler {

    @Autowired
    BillDao billDao;

    @Autowired
    BillService billService;

    //lấy tất cả đơn hàng
    @GetMapping("/findAll")
    public ResponseEntity<?> getAllBill(){
        return ResponseEntity.ok(new Res(billDao.findAll(),"Thành công", true));
    }

    @GetMapping("/cancel/{idbill}")
    public ResponseEntity<Res> cancelBill(@PathVariable("idbill") String idbill){
        return ResponseEntity.ok(new Res(billService.cancelBillManager(idbill),"Save success", true));
    }

    @GetMapping("/confirm/{idbill}")
    public ResponseEntity<Res> confirmBill(@PathVariable("idbill") String idbill){
        return ResponseEntity.ok(new Res(billService.confirmBillManager(idbill),"Save success", true));
    }

    @GetMapping("/ship/{idbill}")
    public ResponseEntity<Res> shipBill(@PathVariable("idbill") String idbill){
        return ResponseEntity.ok(new Res(billService.shipBillManager(idbill),"Save success", true));
    }

    @GetMapping("/received/{idbill}")
    public ResponseEntity<Res> receivedBill(@PathVariable("idbill") String idbill){
        return ResponseEntity.ok(new Res(billService.receivedBillManager(idbill),"Save success", true));
    }

    @GetMapping("/refund/{idbill}")
    public ResponseEntity<Res> refundBill(@PathVariable("idbill") String idbill){
        return ResponseEntity.ok(new Res(billService.refundBillManager(idbill),"Save success", true));
    }

    //thông tin đơn hàng bên vận chuyển
    @PostMapping("/shiping")
    public ResponseEntity<Res> shipingBill(@RequestBody ShipingRequest shipingRequest){
        return ResponseEntity.ok(new Res(billService.shipingBill(shipingRequest),"Save success",true));
    }

    @GetMapping("/shiping/{idBill}")
    public ResponseEntity<Res> shipingBill(@PathVariable("idBill") String idBill) throws IOException {
        return ResponseEntity.ok(new Res(billService.getShipingBill(idBill),"Save success",true));
    }
    
    @PostMapping("/updateInline")
	public ResponseEntity<?> updateInline(String createdItems,
	        @RequestParam(required = false,value ="updatedItems") String updatedItems,
	        @RequestParam(required = false,value ="deletedItems") String deletedItems) throws IOException{
		try {
			ObjectMapper json = new ObjectMapper();
			List<Bill> created = new ArrayList<>();
			List<Bill> updated = new ArrayList<>();
			List<Bill> deleted = new ArrayList<>();

			created = Arrays.asList(json.readValue(createdItems,Bill[].class));
			updated = Arrays.asList(json.readValue(updatedItems,Bill[].class));
			deleted = Arrays.asList(json.readValue(deletedItems,Bill[].class));

			if(created.size() > 0) {
				for(Bill entity: created) {
					entity.setIsDelete(false);
				}
				billDao.saveAll(created);
			}
			if(updated.size() > 0) {
				billDao.saveAll(updated);
			}
			if(deleted.size() > 0) {
				for(Bill entity: deleted) {
					entity.setIsDelete(true);
				}
				billDao.saveAll(deleted);
//				categoryDetailService.deleteInBatch(deleted);
			}
			return ResponseEntity.ok(new Res(billDao.findAll(),"Save success",true));
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok(new Res("Save failed",false));
		}
	}
}
