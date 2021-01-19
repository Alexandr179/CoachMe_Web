package ru.coach.web.forms;

import lombok.Data;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Data
public class UserForm {
    @Email(message = "{errors.incorrect.email}")
    private String email;
    // https://docs.jboss.org/hibernate/beanvalidation/spec/2.0/api/javax/validation/constraints/package-summary.html
    private String firstName;
    private String lastName;
    @NotBlank(message = "{errors.blank.password}")
    private String password;
}