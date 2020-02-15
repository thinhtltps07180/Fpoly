package com.poly.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;
@Entity
@Table(name="News")
public class New {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer id;
	@NotBlank(message = "Không được để trống title")// phải là chuỗi String
	@Length(min=6 , message = "title name phải có ít nhất 6 ký tự")
	String title;
	@NotBlank(message = "Không được để trống description")// phải là chuỗi String
	@Length(min=6 , message = "description name phải có ít nhất 6 ký tự")
	String description;
	@NotBlank(message = "Không được để trống content")
	String content;
	String thumbnail;	
//	String CreateBy;	
	@Temporal(TemporalType.DATE)
	Date createDate;
	Boolean status;
//	Integer CategoryId;
	Integer countViewer;
	
	@ManyToOne
	@JoinColumn(name="categoryId")
	Category categories;
	
	@ManyToOne
	@JoinColumn(name="createBy")
	User user;

	public Integer getId() {
		return id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}


	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Category getCategories() {
		return categories;
	}

	public void setCategories(Category categories) {
		this.categories = categories;
	}



	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getCountViewer() {
		return countViewer;
	}

	public void setCountViewer(Integer countViewer) {
		this.countViewer = countViewer;
	}



	
	
	
		

}
