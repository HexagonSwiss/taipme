package org.whitepaper.mobile.controller;

import java.util.List;
import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController; 

import org.whitepaper.bean.AnaFaq;
import org.whitepaper.business.service.AnaFaqService;

@RestController 
@RequestMapping("/mobile/faq")
public class MobileFaqController {

    @PostConstruct
	public void init() {
		System.out.println("MobileFaqController bean creato correttamente: " + this);
	}

    @Autowired
    private AnaFaqService anaFaqService;

	@RequestMapping(value = "/all", method = RequestMethod.GET)
    public List<AnaFaq> getAllFaqs() {
        List<AnaFaq> faqList = anaFaqService.findAll();
        System.out.println("Calling /mobile/faq to retrieve all FAQs");
        return faqList;
    }
}
