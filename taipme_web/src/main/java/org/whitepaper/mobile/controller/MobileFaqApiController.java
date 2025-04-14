package org.whitepaper.mobile.controller;

import java.util.List;
import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController; 

import org.whitepaper.bean.AnaFaq;
import org.whitepaper.business.service.AnaFaqService;

@RestController 
@RequestMapping("/mobile")
public class MobileFaqApiController {

    @PostConstruct
	public void init() {
		System.out.println("MobileFaqApiController bean creato correttamente: " + this);
	}

    @Resource
    private AnaFaqService anaFaqService;

	@RequestMapping(value = "/faq", method = RequestMethod.GET)
    public List<AnaFaq> getAllFaqs() {
        List<AnaFaq> faqList = anaFaqService.findAll();
        return faqList;
    }
}
