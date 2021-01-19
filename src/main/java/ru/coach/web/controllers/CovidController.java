package ru.coach.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.coach.web.services.restTemplate.CovidService;

@Controller
public class CovidController {

    @Autowired
    private CovidService covidService;

    @GetMapping("/covid/summary")
    public String getCovidInformation(Model model) {
        model.addAttribute("countries", covidService.getSummary());
        return "covid_statistic";
    }
}
