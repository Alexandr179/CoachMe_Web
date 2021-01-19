package ru.coach.web.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ru.coach.web.models.User;
import ru.coach.web.rerpositories.UserRepository;

import java.util.List;

@Component
public class UsersSearchServiceImpl implements UsersSearchService {

    @Autowired
    UserRepository usersRepository;

    // пагинация - это получение данных частями (напр. по 10 user's..)
    @Override
    public List<User> searchByEmail(String emailPattern) {
        return usersRepository.searchByEmail(emailPattern);
    }
}
