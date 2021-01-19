package ru.coach.web.rerpositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.coach.web.models.User;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByEmail(String email);

    Optional<User> findByConfirmCode(String confirmCode);

    List<User> searchByEmail(String emailPattern);
}