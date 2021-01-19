package ru.coach.web.services;

import ru.coach.web.models.User;
import java.util.List;

public interface UsersSearchService {
    List<User> searchByEmail(String emailPattern);
}
