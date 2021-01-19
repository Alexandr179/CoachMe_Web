package ru.coach.web.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import ru.coach.web.models.User;
import ru.coach.web.security.details.UserDetailsImpl;

@Component
public class SecurityContextUtil {
    private static final StringBuilder result = new StringBuilder();

    public Authentication getAuthentication() {
        Logger logger = LoggerFactory.getLogger(this.getClass());
        Authentication contextAuthentication = SecurityContextHolder.getContext().getAuthentication();

        if (contextAuthentication != null) {
            boolean authenticated = contextAuthentication.isAuthenticated();
            String name = contextAuthentication.getName();
            result.append("\n")
                    .append("Authentication by name \"")
                    .append(name + "\", now isAuthenticated()=")
                    .append(authenticated)
            ;
            UserDetailsImpl details = (UserDetailsImpl) contextAuthentication.getDetails();

            if (details != null) {
                User user = details.getUser();
                String email = user.getEmail();
                String hashPassword = user.getHashPassword();
                result.append(". AuthUser is: ")
                        .append(email)
                        .append(" hashPassword: ")
                        .append(hashPassword);
            }
            result.append("\n");
            logger.warn(result.toString());
            return contextAuthentication;
        }
        return null;
    }
}
