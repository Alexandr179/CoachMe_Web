package ru.coach.web.controllers.ajaxControllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import ru.coach.web.forms.ThemeForm;
import ru.coach.web.services.ajaxServices.ThemeService;

import java.util.List;

@RestController
public class ThemeAjaxController {

    @Autowired
    private ThemeService themeService;

    @RequestMapping(value = "/themes/users/add", method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<ThemeForm> addUser(@RequestBody ThemeForm themeForm) {
        themeService.addUserToTheme(themeForm);
        System.out.println(themeForm);
        return themeService.getAllNameThemes();
    }
}
