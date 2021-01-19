package ru.coach.web.services.ajaxServices;

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

    @Override
    public void addUserToTheme(ThemeForm themeForm) {
        List<User> themeUsers = userRepository.findAll();
        Optional<User> userOptionalByEmail = userRepository.findByEmail(themeForm.getUserEmail());
        Theme theme = null;
        if (userOptionalByEmail.isPresent()) {
            themeUsers.add(userOptionalByEmail.get());
            theme = Theme.builder()
                    .name(themeForm.getThemeName())
                    .users(themeUsers)
                    .build();
            themeRepository.save(theme);
        }
        log("Saved Theme:" +  theme);
    }

    @Override
    public List<ThemeForm> getAllNameThemes() {
        return themeRepository.findAll().stream()
                .map(theme -> ThemeForm.builder()
                .themeName(theme.getName())
                .build()).collect(Collectors.toList());
    }
}
