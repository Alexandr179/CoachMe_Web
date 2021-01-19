package ru.coach.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.coach.web.models.User;
import ru.coach.web.rerpositories.ThemeRepository;
import ru.coach.web.rerpositories.UserRepository;
import ru.coach.web.security.details.UserDetailsImpl;

@Controller
public class ProfileController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ThemeRepository themeRepository;

    @GetMapping("/profile")
    public String getUsersPage(@AuthenticationPrincipal UserDetailsImpl userDetails, Model model){
        User authUser = userDetails.getUser();
        model.addAttribute("authUser", authUser);
        model.addAttribute("users", userRepository.findAll());
        model.addAttribute("themes", themeRepository.findAll());
        return "profile_page";
    }
}
