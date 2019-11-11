package com.poly.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "Users")
public class User {
	@Id
	@NotBlank(message = "Không được để trống username")// phải là chuỗi String
	String id;
	@Length(min=6 , message = "Mật khẩu phải có ít nhất 6 ký tự")
//	@NotEmpty // 2 trường hợp : chuỗi or tập hợp
	String password;
	String photo;
	@Email
	String email;
//	Integer roleId;

	@ManyToOne
	@JoinColumn(name = "roleId")
	Role roles;
	
	@OneToMany(mappedBy="user" )
	List<New> news;
	
	@OneToMany(mappedBy="user" )
	List<Order> orders;

	

	public List<New> getNews() {
		return news;
	}

	public void setNews(List<New> news) {
		this.news = news;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Role getRoles() {
		return roles;
	}

	public void setRoles(Role roles) {
		this.roles = roles;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

}
