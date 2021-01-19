package ru.coach.web.controllers.ajaxControllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ru.coach.web.models.User;
import ru.coach.web.services.UsersSearchService;
import java.util.List;

@RestController
public class UsersAjaxController {

    @Autowired
    private UsersSearchService usersSearchService;

    //http://localhost:8080/users/search?email=or
    @RequestMapping(value = "/users/add", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<User> searchUser(@RequestParam("email") String emailPattern) {
        return usersSearchService.searchByEmail(emailPattern);
    }
}
