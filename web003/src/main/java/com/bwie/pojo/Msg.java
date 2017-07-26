/**
 * 
 */
package com.bwie.pojo;

import java.util.HashMap;
import java.util.Map;

/**
 *@功能描述:TODO
 
 *@作者:Chenjin
 
 *@日期:2017-7-12 下午9:01:35
 
 */
public class Msg {
	
	private int code;//状态码：100表示成功,200表示失败
	private String result;//操作成功，操作失败
	private Map<String, Object> data=new HashMap<String, Object>();
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Map<String, Object> getData() {
		return data;
	}
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
	
	//返回成功方法
	public static Msg success(){
		Msg msg = new Msg();
		msg.setCode(100);
		msg.setResult("success");
		return msg;
	}
	//返回失败方法
	public static Msg fail(){
		Msg msg = new Msg();
		msg.setCode(200);
		msg.setResult("fail");
		return msg;
	}
	//存放数据，支持链式操作
	public  Msg add(String key,Object value){
		this.getData().put(key, value);
		return this;
	}
	public Msg(int code, String result, Map<String, Object> data) {
		this.code = code;
		this.result = result;
		this.data = data;
	}
	public Msg() {
	}
	
	
	
	
	
	

}
