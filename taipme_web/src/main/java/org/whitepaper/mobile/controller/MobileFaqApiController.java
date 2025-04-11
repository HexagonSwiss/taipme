package org.whitepaper.mobile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
// Import RequestMethod
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController; // Keep RestController (available since 4.0)
import org.whitepaper.bean.AnaFaq;
import org.whitepaper.business.service.AnaFaqService;
import org.whitepaper.business.service.impl.AnaFaqServiceImpl;

/**
 * REST API Controller for managing FAQs for mobile clients.
 */
@RestController // This should be available in Spring 4.1.6
@RequestMapping("/api/mobile/faqs") // Base URL path
public class MobileFaqApiController {

    @Autowired
    private AnaFaqServiceImpl anaFaqService;

    /**
     * Handles GET requests to /api/mobile/faqs
     * Fetches all FAQs using the service and returns them as a list.
     * Spring MVC + Jackson will automatically convert the List<AnaFaq> to JSON.
     * @return A list of AnaFaq DTOs.
     */

	@RequestMapping(method = RequestMethod.GET)
    public List<AnaFaq> getAllFaqs() {
        List<AnaFaq> faqList = anaFaqService.findAll();
        return faqList;
    }

    // Example: Get FAQ by ID using @RequestMapping with method and path variable
    /*
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public AnaFaq getFaqById(@PathVariable Integer id) {
        return anaFaqService.findById(id);
    }
    */

}
