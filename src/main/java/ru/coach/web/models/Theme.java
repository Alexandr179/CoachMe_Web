package ru.coach.web.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

@Entity
@Table
public class Theme {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;

    @ManyToMany
    @JoinTable(name = "simple_user_theme", joinColumns = @JoinColumn(name = "theme_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "simple_user_id", referencedColumnName = "id"))
    @JsonIgnore
    private List<User> users;
}
