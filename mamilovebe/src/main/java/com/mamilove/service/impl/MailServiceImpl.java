package com.mamilove.service.impl;

import com.mamilove.dao.AccountDao;
import com.mamilove.entity.Account;
import com.mamilove.entity.Bill;
import com.mamilove.service.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;

@Service
public class MailServiceImpl implements MailService {
    @Autowired
    AccountDao accountDao;

//    @Autowired
//    CountryRepository countryRepo;

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    PasswordEncoder passwordEncoder;


    public void sendCreateBill(Account account, Bill bill)
            throws UnsupportedEncodingException, MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        helper.setFrom("contact@shopme.com", "Mami Love Shop");
        helper.setTo(account.getEmail());

        String subject = "Đã tạo đơn hàng";

        String content = "<p>Xin chào <b>" + account.getUsername() + "!</b></p>"
                + "<p>Đơn hàng của bạn đã được tạo!</p>"
                + "<p>Thông tin đơn hàng.</p>"
                + "<p>Mã đơn hàng: <b>" + bill.getId() + "</b></p>"
                + "<br>"
                + "<p>Họ tên người nhận: <b>" + bill.getFullname() + "</b></p>"
                + "<p>Tổng giá trị đơn hàng: <b>" + bill.getTotal() + "VND</b></p>"
                + "<p>Địa chỉ nhận hàng: <b>" + bill.getAddress() + "</b></p>"
                + "<p><b>" + (bill.getPayment() ? "Đã thanh toán" : "Thanh toán khi nhận hàng") + "</b></p>"
                + "<br>"
                + "<p><u>Mọi thắc mắc vui lòng liên hệ:</u> mamilovepro2112@gmail.com</p>";

        helper.setSubject(subject);

        helper.setText(content, true);

        mailSender.send(message);
    }
}
