package fr.epf.userdatabase.domain;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by Alexandre on 12/11/2014.
 */
@Entity
@Table(name="role")
public class Role {

    private int role_id;

    private String description;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
