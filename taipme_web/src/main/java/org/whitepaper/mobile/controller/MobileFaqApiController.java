package org.whitepaper.mobile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController; 
import org.whitepaper.bean.AnaFaq;
import org.whitepaper.business.service.impl.AnaFaqServiceImpl;

/**
 * REST API Controller for managing FAQs for mobile clients.
 */
@RestController 
@RequestMapping("/api/mobile/faqs")
public class MobileFaqApiController {

    @Autowired
    private AnaFaqServiceImpl anaFaqService;

	@RequestMapping(method = RequestMethod.GET)
    public List<AnaFaq> getAllFaqs() {
        List<AnaFaq> faqList = anaFaqService.findAll();
        return faqList;
    }
}
