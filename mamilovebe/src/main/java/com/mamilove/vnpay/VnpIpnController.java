//package com.mamilove.vnpay;
//
//
//import com.mamilove.dao.CustomerDao;
//import com.mamilove.entity.History;
//import com.mamilove.entity.Mamipay;
//import com.mamilove.service.service.CustomerService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//
//import javax.servlet.http.HttpServletRequest;
//import java.io.UnsupportedEncodingException;
//import java.util.Enumeration;
//import java.util.HashMap;
//import java.util.Map;
//
//@Controller
//public class VnpIpnController {
//    @Autowired
//    MamiPayService mamiPayService;
//    @Autowired
//    CustomerService customerService;
//    @Autowired
//    HistoryService historyService;
//    @Autowired
//    CustomerDao customerDao;
//
//    @GetMapping("/VnPayIPN")
//    public String VnPayIPN(HttpServletRequest req) throws UnsupportedEncodingException {
//        Map fields = new HashMap();
//        for (Enumeration params = req.getParameterNames(); params.hasMoreElements(); ) {
//            String fieldName = (String) params.nextElement();
//            String fieldValue = req.getParameter(fieldName);
//            if ((fieldValue != null) && (fieldValue.length() > 0)) {
//                fields.put(fieldName, fieldValue);
//            }
//        }
//        String vnp_SecureHash = req.getParameter("vnp_SecureHash");
//        if (fields.containsKey("vnp_SecureHashType")) {
//            fields.remove("vnp_SecureHashType");
//        }
//        if (fields.containsKey("vnp_SecureHash")) {
//            fields.remove("vnp_SecureHash");
//        }
//        String signValue = VnpayConfig.hashAllFields(fields);
//        if (signValue.equals(vnp_SecureHash)) {
//            if ("00".equals(req.getParameter("vnp_ResponseCode"))) {
////                for (History htr : historyService.findAll()
////                ) {
//                    Long trading_code = Long.parseLong((String) fields.get("vnp_TxnRef"));
//                   History htr = historyService.FinbyTrading_code(trading_code);
//                    if (htr.getStatus().equals(false)) {
//                        htr.setIdhistory(htr.getIdhistory());
//                        htr.setStatus(true);
//                        historyService.creat(htr);
//
//                        //thêm vào mamipay
//                        Double amounts = Double.parseDouble((String) fields.get("vnp_Amount"))/100;
//                        Mamipay mamipay = mamiPayService.finById(htr.getMamipay().getIdmamipay());
//                        mamipay.setIdmamipay(htr.getMamipay().getIdmamipay());
//                        mamipay.setSurplus(mamipay.getSurplus() + amounts);
//                        mamiPayService.create(mamipay);
//                        return "forward:/VnPayReturn";
//                    }
//
//                return "forward:/VnPayReturn";
//            } else {
//                System.out.print("GD Khong thanh cong");
//            }
//        }
//        return null;
//    }
//}
