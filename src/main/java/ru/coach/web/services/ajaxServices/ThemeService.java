package ru.coach.web.services.ajaxServices;

import ru.coach.web.forms.ThemeForm;

import java.util.List;

public interface ThemeService {

    void addUserToTheme(ThemeForm themeForm);

    List<ThemeForm> getAllNameThemes();
}
