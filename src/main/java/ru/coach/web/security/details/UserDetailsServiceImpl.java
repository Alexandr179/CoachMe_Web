package ru.coach.web.security.details;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.coach.web.models.User;
import ru.coach.web.rerpositories.UserRepository;

@Service(value = "customUserDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String email) {// throws UsernameNotFoundException
//        User user = userRepository.findFirstByEmail(email).orElseThrow(() -> {throw new UsernameNotFoundException("User not found");});

        //  unreported exception java.lang.Throwable... на сервере-Ubuntu выдает
        User user = userRepository.findFirstByEmail(email).orElse(null);
        return new UserDetailsImpl(user);
    }
}
