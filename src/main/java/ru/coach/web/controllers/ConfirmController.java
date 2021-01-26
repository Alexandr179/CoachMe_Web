package ru.coach.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ru.coach.web.services.comfirmeServices.ConfirmService;

@Controller
public class ConfirmController {

    @Autowired
    private ConfirmService confirmService;

    @GetMapping(value = "/users/confirm/{confirm-code}")
    public String getConfirmPage(@PathVariable("confirm-code") String confirmCode, Model model){

        boolean isConfirmed = confirmService.confirmUser(confirmCode);
        model.addAttribute("isConfirmed", isConfirmed);
        return "success_confirm_page";
    }
}
