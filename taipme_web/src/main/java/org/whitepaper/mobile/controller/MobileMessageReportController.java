package org.whitepaper.mobile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.whitepaper.bean.MessaggioSegnalato;
import org.whitepaper.business.service.MessaggioSegnalatoService;

@RestController
@RequestMapping("/mobile/message-reports")
public class MobileMessageReportController {

    @Autowired
    private MessaggioSegnalatoService messaggioSegnalatoService;

    @RequestMapping(method = RequestMethod.GET)
    public List<MessaggioSegnalato> getAllReports() {
        return messaggioSegnalatoService.findAll();
    }

    @RequestMapping(value = "/count", method = RequestMethod.GET)
    public long countReports() {
        return messaggioSegnalatoService.coutAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public MessaggioSegnalato getReportById(@PathVariable("id") Integer id) {
        return messaggioSegnalatoService.findById(id);
    }

    @RequestMapping(method = RequestMethod.POST)
    public MessaggioSegnalato createReport(@RequestBody MessaggioSegnalato report) {
        return messaggioSegnalatoService.create(report);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public MessaggioSegnalato updateReport(@PathVariable("id") Integer id, @RequestBody MessaggioSegnalato report) {
        report.setIdMsgSegn(id);
        return messaggioSegnalatoService.update(report);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deleteReport(@PathVariable("id") Integer id) {
        messaggioSegnalatoService.delete(id);
    }
}
