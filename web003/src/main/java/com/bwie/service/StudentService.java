/**
 * 
 */
package com.bwie.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bwie.pojo.Classes;
import com.bwie.pojo.Student;

/**
 *@功能描述:TODO
 
 *@作者:Chenjin
 
 *@日期:2017-6-28 下午3:40:50
 
 */
public interface StudentService {
	
	public void add(Student student);
	public List<Student> students(@Param("name")String name);
	public void delete(Integer id);
	public Student getById(Integer id);
	public void update(Student student);
	public List<Classes> classes();
	
}
