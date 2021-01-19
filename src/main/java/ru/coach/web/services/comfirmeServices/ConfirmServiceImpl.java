package ru.coach.web.services.comfirmeServices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.coach.web.models.State;
import ru.coach.web.models.User;
import ru.coach.web.rerpositories.UserRepository;
import java.util.Optional;

@Service
public class ConfirmServiceImpl implements ConfirmService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean confirmUser(String confirmCode) {
        Optional<User> optionalUser = userRepository.findByConfirmCode(confirmCode);

        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            user.setState(State.CONFIRMED);//TODO <<< confirm Account by email
            userRepository.save(user);
            return true;
        }
        return false;
    }
}
