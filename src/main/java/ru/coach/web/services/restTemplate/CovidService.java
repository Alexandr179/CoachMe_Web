package ru.coach.web.services.restTemplate;

import ru.coach.web.dto.CountryDto;
import java.util.List;

public interface CovidService {
    List<CountryDto> getSummary();
}
