/**
 * 
 */
package com.bwie.pojo;

import java.util.Date;

/**
 *@功能描述:TODO
 
 *@作者:Chenjin
 
 *@日期:2017-6-28 下午3:37:25
 
 */
public class Student {
	
	private Integer id;
	private String name;
	private Date birthday;
	private Integer gender;
	private	Integer age;
	private Classes classes;
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
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	public Student(Integer id, String name, Date birthday, Integer gender,
			Integer age, Classes classes) {
		this.id = id;
		this.name = name;
		this.birthday = birthday;
		this.gender = gender;
		this.age = age;
		this.classes = classes;
	}
	public Student() {
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", birthday="
				+ birthday + ", gender=" + gender + ", age=" + age
				+ ", classes=" + classes + "]";
	}
	
	

}
