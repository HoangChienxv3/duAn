package com.mamilove.controllers;

import com.mamilove.config.VnpayConfig;
import com.mamilove.entity.Customer;
import com.mamilove.entity.History;
import com.mamilove.entity.Mamipay;
import com.mamilove.service.service.CustomerService;
import com.mamilove.service.service.HistoryService;
import com.mamilove.service.service.MamiPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@Controller
public class VnpIpnController {
    @Autowired
    MamiPayService mamiPayService;
    @Autowired
    CustomerService customerService;
    @Autowired
    HistoryService historyService;

    @GetMapping("/VnPayIPN")
    public String VnPayIPN(HttpServletRequest req,
                           @RequestParam("vnp_TxnRef") String TxnRef
    ) throws UnsupportedEncodingException {
        Map fields = new HashMap();
        for (Enumeration params = req.getParameterNames(); params.hasMoreElements(); ) {
            String fieldName = (String) params.nextElement();
            String fieldValue = req.getParameter(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }
        String vnp_SecureHash = req.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = VnpayConfig.hashAllFields(fields);
        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(req.getParameter("vnp_ResponseCode"))) {
                Double amount = Double.parseDouble((String) fields.get("vnp_Amount"));
                //thêm vào db
                Long id = 2l; //idcustormer
                Mamipay mm = new Mamipay();
                Customer ct = customerService.findById(id);
                for (Mamipay a : mamiPayService.findAll()
                ) {
                    if (a.getCustomer().getId() == id) {
                        Double Surplus = a.getSurplus();
                        a.setIdmamipay(a.getIdmamipay());
                        a.setSurplus(Surplus + amount);
                        a.setCustomer(ct);
                        Mamipay mamipay = mamiPayService.create(a);
                        //thêm vào hestory
                        Long trading_code = Long.parseLong((String) fields.get("vnp_TxnRef"));
                        String description = ((String) fields.get("vnp_OrderInfo"));
                        History htr = new History();
                        htr.setTrading_code(trading_code);
                        htr.setSurplus(mamipay.getSurplus());
                        htr.setDescription(description);
                        htr.setMamipay(mamipay);
                        Date date = new Date();
                        htr.setTime(date);
                        historyService.creat(htr);
                        return "forward:/VnPayReturn";
                    }
                }
                for (Mamipay a : mamiPayService.findAll()
                ) {
                    if (a.getCustomer().getId() != id) {
                        mm.setSurplus(amount);
                        mm.setCustomer(ct);
                        Mamipay mamipay = mamiPayService.create(mm);
                        //thêm vào hestory
                        Long trading_code = Long.parseLong((String) fields.get("vnp_TxnRef"));
                        String description = ((String) fields.get("vnp_OrderInfo"));
                        History htr = new History();
                        htr.setTrading_code(trading_code);
                        htr.setSurplus(mamipay.getSurplus());
                        htr.setDescription(description);
                          Date date = new Date();
                        htr.setTime(date);
                        htr.setMamipay(mamipay);
                        historyService.creat(htr);
                        return "forward:/VnPayReturn";
                    }
                }
            } else {
                System.out.print("GD Khong thanh cong");
            }
        }
        return null;
    }
}
