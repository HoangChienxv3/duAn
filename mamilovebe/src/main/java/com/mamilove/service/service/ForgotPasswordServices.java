package com.mamilove.service.service;

import com.mamilove.dao.AccountDao;
import com.mamilove.entity.Account;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;
import java.io.UnsupportedEncodingException;
import java.util.Date;

@Service
@Transactional
public class ForgotPasswordServices {
    @Autowired
    AccountDao accountDao;

//    @Autowired
//    CountryRepository countryRepo;

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    PasswordEncoder passwordEncoder;

    public void generateOneTimePassword(Account account)
            throws UnsupportedEncodingException, MessagingException {
        String OTP = RandomString.make(8);
        String encodedOTP = passwordEncoder.encode(OTP);

        account.setOneTimePassword(encodedOTP);
        account.setOtpRequestedTime(new Date());

        accountDao.save(account);

        sendOTPEmail(account, OTP);
    }

    public void sendOTPEmail(Account account, String OTP)
            throws UnsupportedEncodingException, MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        helper.setFrom("contact@shopme.com", "Mami Love Support");
        helper.setTo(account.getEmail());

        String subject = "Đây là Mật khẩu dùng một lần (OTP) của bạn - Hết hạn sau 5 phút!";

        String content = "<p>Xin chào " + account.getUsername() + "</p>"
                + "<p>Vì lý do bảo mật, bạn bắt buộc phải sử dụng "
                + "OTP để thay đổi mật khẩu:</p>"
                + "<p><b>" + OTP + "</b></p>"
                + "<br>"
                + "<p>Lưu ý: OTP này sẽ hết hạn sau 5 phút.</p>";

        helper.setSubject(subject);

        helper.setText(content, true);

        mailSender.send(message);
    }

//    public void clearOTP(Account account) {
//        account.setOneTimePassword(null);
//        account.setOtpRequestedTime(null);
//        accountDao.save(account);
//    }
}
