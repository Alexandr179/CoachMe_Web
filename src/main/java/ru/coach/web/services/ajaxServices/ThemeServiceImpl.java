package ru.coach.web.services.ajaxServices;

import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.coach.web.forms.ThemeForm;
import ru.coach.web.models.Theme;
import ru.coach.web.models.User;
import ru.coach.web.rerpositories.ThemeRepository;
import ru.coach.web.rerpositories.UserRepository;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static com.sun.activation.registries.LogSupport.log;

@Slf4j
@Service
public class ThemeServiceImpl implements ThemeService {

    @Autowired
    private ThemeRepository themeRepository;

    @Autowired
    private UserRepository userRepository;

    /**
     * @param themeForm is form-data from ajax.
     *                  adding to entity with joinedTable!! <----------------
     */
    @Override
    public void addUserToTheme(@NonNull ThemeForm themeForm) {//TODO without confirm on existing by ..name's!
        String userEmail = themeForm.getUserEmail();
        User user = userRepository.findAllByEmail(userEmail).get(0);// anyone ..User
        log.info("user.getThemes(): " + user.getThemes());

        String themeName = themeForm.getThemeName();
        Theme theme = themeRepository.findAllByName(themeName).get(0);//Theme
        theme.getUsers().add(user);
        log.warn("user.getThemes() AFTER adding: " + user.getThemes());

        themeRepository.save(theme);
    }

    @Override
    public List<ThemeForm> getAllNameThemes() {
        return themeRepository.findAll().stream()
                .map(theme -> ThemeForm.builder()
                        .themeName(theme.getName())
                        .build()).collect(Collectors.toList());
    }
}
