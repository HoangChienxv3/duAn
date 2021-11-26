package com.mamilove.vnpay;

import com.mamilove.controllers.BaseController;
import com.mamilove.dao.CustomerDao;
import com.mamilove.entity.Customer;
import com.mamilove.entity.History;
import com.mamilove.entity.Mamipay;
import com.mamilove.request.dto.PaymenDto;
import com.mamilove.request.dto.Res;
import com.mamilove.response.dto.VnpayDto;
import com.mamilove.service.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@CrossOrigin("*")
@RequestMapping("/Customer/VnpayController")
public class VnpayController extends BaseController {
    @Autowired
    MamiPayService mamiPayService;
    @Autowired
    CustomerService customerService;
    @Autowired
    HistoryService historyService;
    @Autowired
    CustomerDao customerDao;

    @PostMapping("/vnpay")
    public ResponseEntity<?> thanhtoan(@RequestBody PaymenDto paymenDto) throws IOException {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String vnp_OrderInfo = paymenDto.getDescription(); //Mô tả
        String orderType = "200000";//Mã loại hàng hóa
        String vnp_TxnRef = VnpayConfig.getRandomNumber(8);
        String vnp_IpAddr = VnpayConfig.getIpAddress;
        String vnp_TmnCode = VnpayConfig.vnp_TmnCode;//Mã website
        Long amount = paymenDto.getAmount() * 100;

        Map vnp_Params = new HashMap();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        String bank_code = paymenDto.getBankcode();
        if (bank_code != null && !bank_code.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bank_code);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
        vnp_Params.put("vnp_OrderType", orderType);
        paymenDto.setLanguage("vn");///////3
        String locate = paymenDto.getLanguage();
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", VnpayConfig.vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        //Add Params of 2.1.0 Version
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = VnpayConfig.hmacSHA512(VnpayConfig.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = VnpayConfig.vnp_PayUrl + "?" + queryUrl;
        ///thêm vào db
        Customer customer = customerService.findByAccount(getAuthUID());
        Long idcustormer = customer.getId(); //idcustormer
        //kiểm tra đã có account => mamipay
		Mamipay mm = mamiPayService.MamipayIdCt(idcustormer);
        if (mm == null) {
            return ResponseEntity.ok(new Res(null, "Bạn chưa có  tài khoản", true));
        }
        //else
        Long trading_code = Long.parseLong((String) vnp_Params.get("vnp_TxnRef"));
        Double amounts = Double.parseDouble((String) vnp_Params.get("vnp_Amount"));
        String description = (String) vnp_Params.get("vnp_OrderInfo");
        History history = new History();

        history.setDescription(description);
        history.setSurplus(mm.getSurplus() + amounts);
        Date date = new Date();
        history.setTime(date);
        history.setTrading_code(trading_code);
        history.setMamipay(mm);
        history.setContent("Nap tien vao vi");
        history.setStatus(false);
        history.setAmounts(amounts);
        historyService.creat(history);
        ///
        return ResponseEntity.ok(new Res(paymentUrl, "thành công", true));
    }


    @GetMapping("/VnPayReturn")
    public ResponseEntity<?> VnPayReturn(HttpServletRequest req) throws UnsupportedEncodingException {
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
                Long amount = Long.parseLong((String) fields.get("vnp_Amount"));
                Integer status = Integer.parseInt((String) fields.get("vnp_ResponseCode"));
                VnpayDto vnPpay = new VnpayDto();
                vnPpay.setAmount(amount);
                vnPpay.setDescription((String) fields.get("vnp_OrderInfo"));
                vnPpay.setStatus(status);
                return ResponseEntity.ok(new Res(vnPpay, "dat", true));
            } else {
                System.out.print("GD Khong thanh cong");
            }
        }
        return ResponseEntity.ok(new Res(null, "Chữ ký không hợp lệ", true));
    }
}
