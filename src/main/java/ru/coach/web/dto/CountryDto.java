package ru.coach.web.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

@ToString
public class CountryDto {

    @JsonProperty(value = "Country")// TODO https://api.covid19api.com/summary     наглядно видно,- в JSON .."Country" !
    private String country;

    @JsonProperty(value = "NewConfirmed")
    private Long newConfirmed;

    @JsonProperty(value = "TotalConfirmed")
    private Long totalConfirmed;
}
