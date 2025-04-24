package org.whitepaper.mobile.controller;

import java.util.List;
import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.whitepaper.bean.Messaggio;
import org.whitepaper.business.service.MessaggioService;

@RestController
@RequestMapping("/mobile/messages")
public class MobileMessageController {

    @PostConstruct
	public void init() {
		System.out.println("MobileMessageController bean creato correttamente: " + this);
	}

    @Autowired
    private MessaggioService messaggioService;

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public List<Messaggio> getAllMessages() {
        return messaggioService.findAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Messaggio getMessageById(@PathVariable("id") Integer id) {
        return messaggioService.findById(id);
    }

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public Messaggio saveMessage(@RequestBody Messaggio messaggio) {
        System.out.println("Messaggio ricevuto: " + messaggio);
        return messaggioService.save(messaggio);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public Messaggio updateMessage(@PathVariable("id") Integer id, @RequestBody Messaggio messaggio) {
        messaggio.setIdMsg(id);
        return messaggioService.update(messaggio);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deleteMessage(@PathVariable("id") Integer id) {
        messaggioService.delete(id);
    }
}
