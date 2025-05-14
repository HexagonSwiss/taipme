package org.whitepaper.business.service.impl.custom;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Service;

@Service("sendMailService")
public class SendEmailService {

	protected String confUtenzaTemplateFolder = "mail/conf_utenza";
	protected String forgotPwdTemplateFolder = "mail/forgot_pwd";

	private String EMAIL_FIRMA = "Ti aspettiamo su <a href=\"https://taipme.com\" target=\"_blank\">TaipMe</a>"
			+ "<br/><i>Scrivi qualsiasi cosa tu voglia. Tutti leggeranno, solo uno ti risponderà.</i>"
			+ "<br/>"
			+ "<br/><b>I nostri canali ufficiali:</b>"
			+ "<br/>- <a href=\"https://t.me/taipme_com\" target=\"_blank\">Telegram</a>"
			+ "<br/>- <a href=\"https://whatsapp.com/channel/0029Va7dGqBDOQIVEhNNlK3w\" target=\"_blank\">WhatsApp</a>";
	private String EMAIL_NO_REPLY = "Questo messaggio è stato inviato in modalità automatica, per cortesia non rispondere.";

	@Autowired
	protected EmailService emailService;

	// TODO: REMOVE THIS IN PRODUCTION
	protected String fromEmail = "no-reply@taipme.com";
	//  protected String fromEmail = "no-reply@optifid.ch";

	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail;
	}

	public void sendConfUtenzaMail(String email, String link) throws MailException {
		Map<String, Object> templateContext = new HashMap<String, Object>();
		templateContext.put("LINK_PWD", link);
		templateContext.put("NICKNAME_SCELTO", email);

		templateContext.put("EMAIL_FIRMA", this.EMAIL_FIRMA);
		templateContext.put("EMAIL_NO_REPLY", this.EMAIL_NO_REPLY);

		emailService.sendEmail(email, fromEmail, confUtenzaTemplateFolder, templateContext, null);
	}

	public void sendForgotPasswordMail(String email, String link) throws MailException {
		Map<String, Object> templateContext = new HashMap<String, Object>();
		templateContext.put("NOME", email);
		templateContext.put("LINK_PWD", link);

		templateContext.put("EMAIL_FIRMA", this.EMAIL_FIRMA);
		templateContext.put("EMAIL_NO_REPLY", this.EMAIL_NO_REPLY);

		emailService.sendEmail(email, fromEmail, forgotPwdTemplateFolder, templateContext, null);
	}
}
