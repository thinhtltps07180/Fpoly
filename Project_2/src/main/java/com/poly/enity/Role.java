package com.poly.enity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Role")
public class Role {
	@Id
	@GeneratedValue
	Integer id;
	String name;
	
	@OneToMany(mappedBy="RoleId")
    private List<User> UserId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<User> getUserId() {
		return UserId;
	}

	public void setUserId(List<User> userId) {
		UserId = userId;
	}
	
	
	
	

}
