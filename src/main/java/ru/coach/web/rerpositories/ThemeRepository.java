package ru.coach.web.rerpositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.coach.web.models.Theme;

import java.util.List;
import java.util.Optional;

public interface ThemeRepository extends JpaRepository<Theme, Long> {

    List<Theme> findAllByName(String themeName);
}
