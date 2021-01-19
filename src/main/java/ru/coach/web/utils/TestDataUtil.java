/*
 * 44.Rest_API_Spring_Boot. 16.12.2020, 14:48 / 16.12.2020, 14:48   @A.Alexandr
 * Copyright (c)
 */
package ru.coach.web.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import ru.coach.web.models.Authority;
import ru.coach.web.models.State;
import ru.coach.web.models.Theme;
import ru.coach.web.models.User;
import ru.coach.web.rerpositories.ThemeRepository;
import ru.coach.web.rerpositories.UserRepository;

import java.util.ArrayList;
import java.util.List;

@Component
public class TestDataUtil {

    @Autowired
    @Qualifier("bcPasswordEncoder")
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ThemeRepository themeRepository;

    @Transactional
    public void initializeData() {
        User user1 = User.builder()
                .firstName("User1")
                .lastName("U.")
                .email("user1@gmail.com")
                .hashPassword(passwordEncoder.encode("qwerty001"))
                .authority(Authority.USER)
                .state(State.NOT_CONFIRMED)
                .build();

        User user2 = User.builder()
                .firstName("User2")
                .lastName("U.")
                .email("user2@gmail.com")
                .hashPassword(passwordEncoder.encode("qwerty002"))
                .authority(Authority.USER)
                .state(State.NOT_CONFIRMED)
                .build();

        User user3 = User.builder()
                .firstName("User3")
                .lastName("U.")
                .email("user3@gmail.com")
                .hashPassword(passwordEncoder.encode("qwerty003"))
                .authority(Authority.USER)
                .state(State.CONFIRMED)
                .build();

        User admin = User.builder()
                .firstName("Admin")
                .lastName("A.")
                .email("admin@gmail.com")
                .hashPassword(passwordEncoder.encode("qwerty"))
                .authority(Authority.ADMIN)
                .state(State.CONFIRMED)
                .build();

        userRepository.save(user1);
        userRepository.save(user2);
        userRepository.save(user3);
        userRepository.save(admin);

        List<User> themeUsers = new ArrayList<>();
        themeUsers.add(user1);
        themeUsers.add(user2);
        themeUsers.add(admin);

        Theme themeFromRelations = Theme.builder()
                .name("Relations")
                .users(themeUsers)
                .build();
        Theme themeFromLearning = Theme.builder()
                .name("Learning in School")
                .users(themeUsers)
                .build();

        themeRepository.save(themeFromRelations);
        themeRepository.save(themeFromLearning);
    }
}
