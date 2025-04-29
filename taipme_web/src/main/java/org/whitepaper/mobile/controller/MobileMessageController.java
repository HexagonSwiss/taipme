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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/mobile/messages")
public class MobileMessageController {

    private static final Logger logger = LoggerFactory.getLogger(MobileMessageController.class);

    @PostConstruct
    public void init() {
        logger.info("MobileMessageController bean created: {}", this);
    }

    @Autowired
    private MessaggioService messaggioService;

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public List<Messaggio> getAllMessages() {
        logger.debug("Entering getAllMessages method");
        List<Messaggio> messages = messaggioService.findAll();
        logger.debug("Retrieved {} messages", messages.size());
        return messages;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Messaggio getMessageById(@PathVariable("id") Integer id) {
        logger.debug("Entering getMessageById method with id: {}", id);
        Messaggio message = messaggioService.findById(id);
        logger.debug("Retrieved message: {}", message);
        return message;
    }

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public Messaggio saveMessage(@RequestBody Messaggio messaggio) {
        logger.debug("Entering saveMessage method with message: {}", messaggio);
        Messaggio savedMessage = messaggioService.create(messaggio);
        logger.debug("Saved message: {}", savedMessage);
        return savedMessage;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public Messaggio updateMessage(@PathVariable("id") Integer id, @RequestBody Messaggio messaggio) {
        logger.debug("Entering updateMessage method with id: {} and message: {}", id, messaggio);
        messaggio.setIdMsg(id);
        Messaggio updatedMessage = messaggioService.update(messaggio);
        logger.debug("Updated message: {}", updatedMessage);
        return updatedMessage;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deleteMessage(@PathVariable("id") Integer id) {
        logger.debug("Entering deleteMessage method with id: {}", id);
        messaggioService.delete(id);
        logger.debug("Deleted message with id: {}", id);
    }
}
