package org.whitepaper.mobile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController; 
import org.whitepaper.bean.AnaFaq;
import org.whitepaper.business.service.AnaFaqService;
import org.whitepaper.business.service.impl.AnaFaqServiceImpl;

/**
 * REST API Controller for managing FAQs for mobile clients.
 */
@RestController 
@RequestMapping("/faqs_mobile") 
public class MobileFaqApiController {

    @Autowired
    private AnaFaqService anaFaqService;

    /**
     * Handles GET requests to /faqs_mobile
     * Fetches all FAQs using the service and returns them as a list.
     * Spring MVC + Jackson will automatically convert the List<AnaFaq> to JSON.
     * @return A list of AnaFaq DTOs.
     */

    @RequestMapping(method = RequestMethod.GET)
    public List<AnaFaq> getAllFaqs() {
        List<AnaFaq> faqList = anaFaqService.findAll();
        return faqList;
    }

}
