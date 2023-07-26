package component.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    private final JavaMailSender mailSender;

    @Autowired
    public EmailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendVerificationEmail(String email, String verificationCode) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setFrom("mailtestcjh@gmail.com");
        message.setSubject("[Hospital Mate] 이메일 인증번호");
        message.setText("인증번호 : " + verificationCode);

        try {
        	mailSender.send(message);
            System.out.println("이메일 발송 성공 - 주소: " + email + ", 인증번호 : " + verificationCode);
        } catch (MailException e) {
            System.out.println("이메일 발송 실패 - 주소: " + email + ", 인증번호 : " + verificationCode);
            e.printStackTrace();
        }
    }
}

