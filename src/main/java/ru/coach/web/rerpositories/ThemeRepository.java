package ru.coach.web.rerpositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.coach.web.models.Theme;

public interface ThemeRepository extends JpaRepository<Theme, Long> {
}