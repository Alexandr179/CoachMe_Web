package ru.coach.web.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

@ToString
public class CountriesDto {

    @JsonProperty(value = "Countries")
    private CountryDto [] countries;
}
