package ru.coach.web.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.util.List;

/**
 * TODO: .... many-to-many
 * https://dzone.com/tutorials/java/hibernate/hibernate-example/hibernate-mapping-many-to-many-1.html
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "simple_user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    private String hashPassword;

    @Enumerated(value = EnumType.STRING)
    private Authority authority;

    @Enumerated(value = EnumType.STRING)
    private State state;

    private String confirmCode;

    @ManyToMany(mappedBy = "users")
    private List<Theme> themes;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", hashPassword='" + hashPassword + '\'' +
                ", authority=" + authority +
                ", state=" + state +
                ", confirmCode='" + confirmCode + '\'' +
                '}';
    }
}
