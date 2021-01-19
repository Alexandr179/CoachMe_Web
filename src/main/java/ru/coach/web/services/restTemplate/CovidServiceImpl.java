package ru.coach.web.services.restTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import ru.coach.web.dto.CountriesDto;
import ru.coach.web.dto.CountryDto;
import java.util.Arrays;
import java.util.List;

@Service
public class CovidServiceImpl implements CovidService {

    @Autowired
    private RestTemplate restTemplate;

    @Override
    public List<CountryDto> getSummary() {
       return Arrays.asList(restTemplate.getForObject("https://api.covid19api.com/summary", CountriesDto.class).getCountries());
    }
}
