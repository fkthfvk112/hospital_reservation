package component.service;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
    
    public void sendManagerAppliEmail(String title, String content, File file) {
    	MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom("mailtestcjh@gmail.com");
			helper.setTo("wjdwl545@naver.com");
			helper.setSubject(title);
			helper.setText(content); 
			if (file != null) {
	            helper.addAttachment(file.getName(), file);
	        }
			
			mailSender.send(message);

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }
}