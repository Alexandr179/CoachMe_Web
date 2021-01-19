package ru.coach.web.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.coach.web.models.User;
import ru.coach.web.rerpositories.UserRepository;

@Service
public class SignInServiceImpl implements SignInService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public User loadUserByUsername(String email) throws UsernameNotFoundException {
        return userRepository.findByEmail(email).orElseThrow(() -> {throw new UsernameNotFoundException("User not found");});
    }
}