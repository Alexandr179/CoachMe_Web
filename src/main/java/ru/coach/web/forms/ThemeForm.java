package ru.coach.web.forms;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ThemeForm {
    private String themeName;
    private String userEmail;
}