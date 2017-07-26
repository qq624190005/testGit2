/**
 * 
 */
package com.bwie.serviceImpl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bwie.dao.StudentMapper;
import com.bwie.pojo.Classes;
import com.bwie.pojo.Student;
import com.bwie.service.StudentService;

/**
 *@功能描述:TODO
 
 *@作者:Chenjin
 
 *@日期:2017-6-28 下午3:58:48
 
 */
@Service
@Transactional
public class StudentServiceImpl implements StudentService{
	
	@Autowired
	private StudentMapper mapper;
	
	/* (non-Javadoc)
	 * @see com.bwie.service.StudentService#add(com.bwie.pojo.Student)
	 */
	@Override
	public void add(Student student) {
		// TODO Auto-generated method stub
		mapper.add(student);
	}
	
	/* (non-Javadoc)
	 * @see com.bwie.service.StudentService#delete(java.lang.Integer)
	 */
	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		mapper.delete(id);
	}
	
	/* (non-Javadoc)
	 * @see com.bwie.service.StudentService#getById(java.lang.Integer)
	 */
	@Override
	public Student getById(Integer id) {
		// TODO Auto-generated method stub
		return mapper.getById(id);
	}
	
	/* (non-Javadoc)
	 * @see com.bwie.service.StudentService#students(java.lang.String)
	 */
	@Override
	public List<Student> students(@Param("name") String name) {
		// TODO Auto-generated method stub
		return mapper.students(name);
	}
	
	/* (non-Javadoc)
	 * @see com.bwie.service.StudentService#update(com.bwie.pojo.Student)
	 */
	@Override
	public void update(Student student) {
		// TODO Auto-generated method stub
		mapper.update(student);
	}
	
	/* (non-Javadoc)
	 * @see com.bwie.service.StudentService#classes()
	 */
	@Override
	public List<Classes> classes() {
		// TODO Auto-generated method stub
		return mapper.classes();
	}

}
