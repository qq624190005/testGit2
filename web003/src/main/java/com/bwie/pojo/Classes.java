/**
 * 
 */
package com.bwie.pojo;

import java.util.List;

/**
 *@功能描述:TODO
 
 *@作者:Chenjin
 
 *@日期:2017-6-28 下午3:37:30
 
 */
public class Classes {
	
	private Integer cid;
	private String cname;
	private List<Student> students;
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public List<Student> getStudents() {
		return students;
	}
	public void setStudents(List<Student> students) {
		this.students = students;
	}
	public Classes(Integer cid, String cname, List<Student> students) {
		this.cid = cid;
		this.cname = cname;
		this.students = students;
	}
	public Classes() {
	}
	@Override
	public String toString() {
		return "Classes [cid=" + cid + ", cname=" + cname + ", students="
				+ students + "]";
	}
	
	
	
}
