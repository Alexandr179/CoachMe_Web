package ru.coach.web.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.coach.web.forms.UserForm;
import ru.coach.web.services.SignUpService;

import javax.validation.Valid;

@Slf4j
@Controller
public class SignUpController {

    @Autowired
    private SignUpService signUpService;

    @PostMapping("/signUp")
    public String signUpUser(@Valid UserForm userForm, BindingResult bindingResult, Model model){
        log.error(bindingResult.getAllErrors().toString());
        if (bindingResult.hasErrors()) {
            model.addAttribute("userForm", userForm);//TODO закладываем провалидированную форму (возможно уже с ошибками)
            return "sign_up_page";
        }
        signUpService.signUp(userForm);
        return "redirect:/signIn";
    }

    @GetMapping("/signUp")
    public String getSignUpPage(Authentication authentication, Model model) {
        if (authentication == null) {
            model.addAttribute("userForm", new UserForm());
            return "sign_up_page";
        } else {
            return "redirect:/";
        }
    }
}
