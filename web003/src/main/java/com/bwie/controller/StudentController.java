/**
 * 
 */
package com.bwie.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bwie.pojo.Classes;
import com.bwie.pojo.Msg;
import com.bwie.pojo.Student;
import com.bwie.service.StudentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 *@功能描述:TODO
 
 *@作者:Chenjin
 
 *@日期:2017-6-28 下午4:01:38
 
 */
@Controller
@RequestMapping("student")
public class StudentController {
	
	@Autowired
	private StudentService service;
	
	@RequestMapping("list")
	public ModelAndView classesList(ModelAndView mvc){
		List<Classes> classes = service.classes();
		mvc.addObject("classes",classes);
		mvc.setViewName("forward:/index.jsp");
		return mvc;
	}
	
	
	@RequestMapping("selectPageJson")
	@ResponseBody
	public Msg select(@RequestParam(value="pageno",defaultValue="1")Integer pageno,
			@RequestParam(value="pagesize",defaultValue="5")Integer pagesize,String name){
			//指定查询的页码和每页的条数
			PageHelper.startPage(pageno, pagesize);
			//查询所有的学生信息
			List<Student> students = service.students(name);
			
			PageInfo<Student> pageInfo = new PageInfo<Student>(students);
			
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping("classes")
	@ResponseBody
	public List<Classes> selectClasses(){
		return service.classes();
	}
	
	
	
	/*@RequestMapping("add")
	@ResponseBody
	public String add(Student student,@DateTimeFormat(pattern="yyyy-MM-dd")Date date){
		try {
			student.setBirthday(date);
			service.add(student);
			return "ok";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		//return "redirect:/student/selectAll";
	}*/
	
	@RequestMapping("add")
	@ResponseBody
	public Msg add(Student student,@DateTimeFormat(pattern="yyyy-MM-dd")Date date){
			student.setBirthday(date);
			service.add(student);
			return Msg.success();
		//return "redirect:/student/selectAll";
	}
	
	@RequestMapping("updateStu")
	@ResponseBody
	public String updateStu(Student student,@DateTimeFormat(pattern="yyyy-MM-dd")Date date){
		try {
			student.setBirthday(date);
			service.update(student);
			return "ok";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
	}
	
	/*@RequestMapping("selectAll")
	public ModelAndView select(ModelAndView mvc,String name){
		List<Student> students = service.students(name);
		mvc.addObject("students",students);
		mvc.setViewName("forward:/select.jsp");
		return mvc;
	}*/
	
	@RequestMapping("selectAll")
	public ModelAndView select(@RequestParam(value="pageno",defaultValue="1")Integer pageno,
		@RequestParam(value="pagesize",defaultValue="3")Integer pagesize,ModelAndView mvc,String name){
		//pageno查詢的頁碼
		//pagesize每页显示的数据
		PageHelper.startPage(pageno, pagesize);
		//查询所有的学生的数据
		List<Student> students = service.students(name);
		//将所有学生数据装到pageinfo中
		PageInfo<Student> pageInfo  = new PageInfo<Student>(students);	
	
		mvc.addObject("pageInfo",pageInfo);
		mvc.setViewName("forward:/select.jsp");
		return mvc;
	}
	
	
	@RequestMapping("delete")
	@ResponseBody
	public String delete(int id){
		try {
			System.out.println(id+"---------");
			service.delete(id);
			return "ok";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		//return "redirect:/student/selectAll";
	}
	
	@RequestMapping("getById")
	public ModelAndView getById(int id,ModelAndView mvc){
		Student byId = service.getById(id);
		List<Classes> classes = service.classes();
		mvc.addObject("classes",classes);
		mvc.addObject("student", byId);
		mvc.setViewName("forward:/update.jsp");
		return mvc;
	}
	
	
	
	@RequestMapping("update")
	public String update(Student student,@DateTimeFormat(pattern="yyyy-MM-dd")Date date){
		student.setBirthday(date);
		service.update(student);
		return "redirect:/student/selectAll";
	}
}
