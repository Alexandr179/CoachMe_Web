package ru.coach.web.services;

import ru.coach.web.models.User;

public interface SignInService {

    User loadUserByUsername(String email);
}
