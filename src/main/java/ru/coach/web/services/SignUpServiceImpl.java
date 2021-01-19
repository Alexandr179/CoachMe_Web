package ru.coach.web.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.coach.web.rerpositories.UserRepository;
import ru.coach.web.forms.UserForm;
import ru.coach.web.models.Authority;
import ru.coach.web.models.State;
import ru.coach.web.models.User;
import java.util.UUID;

@Service
public class SignUpServiceImpl implements SignUpService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JavaMailSender javaMailSender;// add sending by gmail <<<<<<<<<

    @Value("${spring.mail.username}")// add sending by gmail <<<<<<<<<
    private String userName;



    @Override
    public void signUp(UserForm userForm) {
        User user = User.builder()
                .email(userForm.getEmail())
                .firstName(userForm.getFirstName())
                .lastName(userForm.getLastName())
                .hashPassword(passwordEncoder.encode(userForm.getPassword()))
                .authority(Authority.USER)
                .state(State.NOT_CONFIRMED)
                .confirmCode(UUID.randomUUID().toString())
                .build();


        // add sending by gmail <<<<<<<<<
        MimeMessagePreparator messagePreparator = mimeMessage -> {
            MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
            messageHelper.setFrom(userName);
            messageHelper.setTo(user.getEmail());
            messageHelper.setSubject("Confirm Registration");
            messageHelper.setText("http://localhost/users/confirm/" + user.getConfirmCode(), true);
        };
        javaMailSender.send(messagePreparator);
        // -------------------------------

        userRepository.save(user);
    }
}
