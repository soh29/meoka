package org.zerock.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.MailVO;
import org.zerock.domain.UserVO;
import org.zerock.service.UserService;

@Controller
@RequestMapping("/mail")
public class MailController {
	String msgFlag = "";

	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	private UserService service;
	
	 @Inject
	 BCryptPasswordEncoder pwdEncoder;
	
	@RequestMapping(value = "/mailForm", method = RequestMethod.GET)
	public String mailFormGet() {
		return "mail/mailForm";

	}

	@RequestMapping(value = "/mailForm", method = RequestMethod.POST)
	public String mailFormPost(UserVO vo) throws Exception {

		System.out.println("*****USERVO*****: " + vo);
		String fromMail = "meoka72@gmail.com";
		String toMail = vo.getEmail();
		String title = vo.getMemberId() + "님, 임시 비밀번호입니다.";
		
		System.out.println(toMail);
		
		try {
			// 인증 번호 생성기
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 10; i++) {
				int rIndex = rnd.nextInt(3);
				switch (rIndex) {
				case 0: // a-z
					temp.append((char) ((int) (rnd.nextInt(26)) + 97));
					break;
				case 1: // A-Z
					temp.append((char) ((int) (rnd.nextInt(26)) + 65));
					break;
				case 2: // 0-9
					temp.append((rnd.nextInt(10)));
					break;
				}
			}
			
			String randomPw = temp.toString();
			vo.setPassword(randomPw);
			String content = vo.getMemberId() + "님 임시비밀번호 : " + vo.getPassword();
			System.out.println(content);
			
			String inputPass = vo.getPassword();
			String pwd = pwdEncoder.encode(inputPass);
			vo.setPassword(pwd);
			
			service.updateRandomPw(vo);
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			// 메일 보관함에 저장
			messageHelper.setFrom(fromMail);
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);

			mailSender.send(message); // 실제 메일 전송
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		msgFlag = "mailSendOk";

		return "/";

	}

}