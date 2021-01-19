package ru.coach.web.forms;

import lombok.Builder;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Data
@Builder
public class ThemeForm {
    private String themeName;
    private String userEmail;
}