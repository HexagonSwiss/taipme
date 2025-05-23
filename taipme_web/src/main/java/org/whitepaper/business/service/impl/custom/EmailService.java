package org.whitepaper.business.service.impl.custom;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.VelocityException;
import org.apache.velocity.tools.generic.DateTool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.MailPreparationException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.util.Assert;

@Service("emailService")
public class EmailService {

	private static Logger logger = LoggerFactory.getLogger(EmailService.class);

	@Autowired
	protected JavaMailSender javaMailSender;

	@Autowired
	protected VelocityEngine velocityEngine;

	@Value("${mail.transport.protocol}")
	private String protocol;
	@Value("${mail.smtp.auth}")
	private String auth;
	@Value("${mail.smtp.starttls.enable}")
	private String tls;
	@Value("${mail.smtp.ssl.enable}")
	private String ssl;
	@Value("${mail.debug}")
	private String debug;

	public void sendEmail(String toEmail, String fromEmail, String templateFolder, Map<String, Object> templateContext,
			File attachment) throws MailException {

		Assert.hasLength(toEmail);
		Assert.hasLength(fromEmail);
		Assert.hasLength(templateFolder);
		Assert.notNull(templateContext);
		templateContext.put("dateTool", new DateTool());
		Locale locale = Locale.ITALIAN;
		String subjectTemplate = getTemplate(templateFolder, "subject", locale, ".txt");
		String htmlBodyTemplate = getTemplate(templateFolder, "body", locale, ".html");
		logger.debug("HTML Body Template Path: {}", htmlBodyTemplate);

		MimeMessage mm = buildMimeMessage(toEmail, fromEmail, templateContext, subjectTemplate, htmlBodyTemplate,
				attachment);

		if (javaMailSender instanceof org.springframework.mail.javamail.JavaMailSenderImpl) {
			org.springframework.mail.javamail.JavaMailSenderImpl sender = (org.springframework.mail.javamail.JavaMailSenderImpl) javaMailSender;
			sender.setJavaMailProperties(getMailProperties());
		} else {
			logger.warn(
					"javaMailSender is not an instance of JavaMailSenderImpl, cannot set JavaMailProperties here. Ensure it's configured globally.");
		}

		try {
			logger.info("Attempting to send email to: {}", toEmail);
			javaMailSender.send(mm);
			logger.info("Email successfully sent to: {}", toEmail);
		} catch (Exception e) {
			logger.error("Failed to send email to {}. Exception: {}", toEmail, e.getMessage(), e);
			if (e instanceof MailException) {
				throw (MailException) e;
			}
			throw new MailPreparationException("Failed to send email: " + e.getMessage(), e);
		}
	}

	public void sendEmailMyOggetto(String toEmail, String fromEmail, String templateFolder,
			Map<String, Object> templateContext, File attachment, String myOggetto) throws MailException {

		Assert.hasLength(toEmail);
		Assert.hasLength(fromEmail);
		Assert.hasLength(templateFolder);
		Assert.notNull(templateContext);
		templateContext.put("dateTool", new DateTool());
		Locale locale = Locale.ITALIAN;
		String subjectTemplate = getTemplate(templateFolder, "subject", locale, ".txt");
		String htmlBodyTemplate = getTemplate(templateFolder, "body", locale, ".html");
		logger.debug(htmlBodyTemplate);
		MimeMessage mm = buildMimeMessageMyOggetto(toEmail, fromEmail, templateContext, subjectTemplate,
				htmlBodyTemplate, attachment, myOggetto);
		org.springframework.mail.javamail.JavaMailSenderImpl sender = (org.springframework.mail.javamail.JavaMailSenderImpl) javaMailSender;
		sender.setJavaMailProperties(getMailProperties());
		// try {
		javaMailSender.send(mm);
		// } catch(Exception e) {
		// logger.error("Exception: "+e.getMessage(), e);
		// }
	}

	public void sendEmail(String[] destinatari, String fromEmail, String templateFolder,
			Map<String, Object> templateContext, File attachment) throws MailException {

		// Assert.hasLength(toEmail);
		Assert.hasLength(fromEmail);
		Assert.hasLength(templateFolder);
		Assert.notNull(templateContext);
		templateContext.put("dateTool", new DateTool());
		Locale locale = Locale.ITALIAN;
		String subjectTemplate = getTemplate(templateFolder, "subject", locale, ".txt");
		String htmlBodyTemplate = getTemplate(templateFolder, "body", locale, ".html");
		logger.debug(htmlBodyTemplate);
		MimeMessage mm = buildMimeMessage(destinatari, fromEmail, templateContext, subjectTemplate, htmlBodyTemplate,
				attachment);
		org.springframework.mail.javamail.JavaMailSenderImpl sender = (org.springframework.mail.javamail.JavaMailSenderImpl) javaMailSender;
		sender.setJavaMailProperties(getMailProperties());
		// try {
		// javaMailSender.send(mm);
		// } catch(Exception e) {
		// logger.error("Exception: "+e.getMessage(), e);
		// }
	}

	private Properties getMailProperties() {
		Properties properties = new Properties();
		properties.setProperty("mail.transport.protocol", protocol);
		properties.setProperty("mail.smtp.auth", auth);
		properties.setProperty("mail.smtp.ssl.enable", "false");
		if ("true".equals(ssl.trim()))
			properties.setProperty("mail.smtp.ssl.enable", "true");

		properties.setProperty("mail.smtp.starttls.enable", "false");
		if ("true".equals(tls.trim()))
			properties.setProperty("mail.smtp.starttls.enable", "true");

		properties.setProperty("mail.debug", debug);
		return properties;
	}

	protected String getTemplate(String templateFolder, String templateBaseName, Locale locale, String templateSuffix) {
		if (!templateFolder.endsWith("/")) {
			templateFolder = templateFolder + "/";
		}
		for (String templatePrefix : getTemplatePrefixesForLocale(templateBaseName, locale)) {
			StringBuilder filename = new StringBuilder(templateFolder);
			filename.append(templatePrefix).append(templateSuffix);
			// if (getClass().getResource("/" + filename.toString()) != null) {
			return filename.toString();
			// }
		}
		throw new IllegalStateException("Template file is missing: " + templateFolder + ":" + templateBaseName + ":"
				+ locale.toString() + ":" + templateSuffix);
	}

	protected List<String> getTemplatePrefixesForLocale(String templateBaseName, Locale locale) {
		StringBuilder templatePrefix = new StringBuilder(templateBaseName);
		List<String> templatePrefixes = new ArrayList<String>();
		String language = locale.getLanguage();
		String country = locale.getCountry();
		String variant = locale.getVariant();
		if (!language.isEmpty()) {
			templatePrefix.append('_').append(language);
			templatePrefixes.add(0, templatePrefix.toString());
		}
		if (!country.isEmpty()) {
			templatePrefix.append('_').append(country);
			templatePrefixes.add(0, templatePrefix.toString());
		}
		if (!variant.isEmpty()) {
			templatePrefix.append('_').append(variant);
			templatePrefixes.add(0, templatePrefix.toString());
		}
		templatePrefixes.add(templateBaseName);
		return templatePrefixes;
	}

	private MimeMessage buildMimeMessage(String toEmail, String fromEmail, Map<String, Object> templateContext,
			String subjectTemplate, String htmlBodyTemplate, File file) {
		MimeMessage mm = javaMailSender.createMimeMessage();
		try {
			MimeMessageHelper mmh = new MimeMessageHelper(mm, true, "UTF-8");
			String subject = "";
			subject = mergeTemplateIntoString(subjectTemplate, templateContext);
			String htmlBody = mergeTemplateIntoString(htmlBodyTemplate, templateContext);
			logger.debug(htmlBody);
			mmh.setText(htmlBody, true);
			if (file != null)
				mmh.addAttachment(file.getName(), file);
			mmh.setTo(toEmail);
			// mmh.setBcc(bcc);
			mmh.setFrom(fromEmail);
			mmh.setSubject(subject);
			return mm;
		} catch (VelocityException ve) {
			throw new MailPreparationException(ve);
		} catch (MessagingException me) {
			throw new MailPreparationException(me);
		}
	}

	private MimeMessage buildMimeMessageMyOggetto(String toEmail, String fromEmail, Map<String, Object> templateContext,
			String subjectTemplate, String htmlBodyTemplate, File file, String myOggetto) {
		MimeMessage mm = javaMailSender.createMimeMessage();
		try {
			MimeMessageHelper mmh = new MimeMessageHelper(mm, true, "UTF-8");
			String subject = myOggetto;
			if (null != myOggetto && !myOggetto.isEmpty())
				subject = mergeTemplateIntoString(subjectTemplate, templateContext);

			String htmlBody = mergeTemplateIntoString(htmlBodyTemplate, templateContext);
			logger.debug(htmlBody);
			mmh.setText(htmlBody, true);
			if (file != null)
				mmh.addAttachment(file.getName(), file);
			mmh.setTo(toEmail);
			// mmh.setBcc(bcc);
			mmh.setFrom(fromEmail);
			mmh.setSubject(subject);
			return mm;
		} catch (VelocityException ve) {
			throw new MailPreparationException(ve);
		} catch (MessagingException me) {
			throw new MailPreparationException(me);
		}
	}

	private MimeMessage buildMimeMessage(String[] toBccEmail, String fromEmail, Map<String, Object> templateContext,
			String subjectTemplate, String htmlBodyTemplate, File file) {
		MimeMessage mm = javaMailSender.createMimeMessage();
		try {
			MimeMessageHelper mmh = new MimeMessageHelper(mm, true, "UTF-8");
			String subject = "";
			subject = mergeTemplateIntoString(subjectTemplate, templateContext);
			String htmlBody = mergeTemplateIntoString(htmlBodyTemplate, templateContext);
			logger.debug(htmlBody);
			mmh.setText(htmlBody, true);
			if (file != null)
				mmh.addAttachment(file.getName(), file);
			// mmh.setTo(toEmail);
			mmh.setBcc(toBccEmail);
			mmh.setFrom(fromEmail);
			mmh.setSubject(subject);
			return mm;
		} catch (VelocityException ve) {
			throw new MailPreparationException(ve);
		} catch (MessagingException me) {
			throw new MailPreparationException(me);
		}
	}

	protected String mergeTemplateIntoString(String templateLocation, Map<String, Object> templateContext)
			throws VelocityException {
		return VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, templateLocation, "UTF-8", templateContext);
	}
}
