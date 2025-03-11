package org.whitepaper.web.controller.custom;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
class TestRestController {


	
    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String hello() {
        return "Hello, World Baby!";
    }
    
}
