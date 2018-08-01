package cn.voteproject.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.voteproject.domain.User;
import cn.voteproject.service.UserService;

/**
 * 处理用户请求模块
 * 使用模型驱动封装对象
 * 用户模块
 */

public class UserAction extends ActionSupport implements ModelDriven<User>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserService service = new UserService();
	private User user = new User();//使用模型驱动必须手动new
	//实现getModel方法进行数据封装
	public User getModel() {
		return this.user;
	}
	
	//转发到登陆jsp页面
	public String loginJsp(){
		return LOGIN;
	}
	
	//转发到注册jsp页面
	public String registerJsp(){
		return "registerfailed";
	}
	
	//转发到修改界面
	public String updateJsp(){
		return "updatejsp";
	}
	
	//登录方法
	public String login(){
		//获取Action上下文对象
		ActionContext context = ActionContext.getContext();
		
		//将数据库查询的数据返回
		User user = service.login(this.user);
		//如果返回不为空，登录成功
		if(user!=null){
			//向session中存入对象
			context.getSession().put("user",user);
			return "loginsuccess";
		}
		//数据回显，保存错误信息
		context.put("massege", "邮箱或密码错误");
		context.put("user", this.user);
		return LOGIN;
	}
	
	//注册方法
	public String register(){
		//获取Action上下文对象
		ActionContext context = ActionContext.getContext();
		HttpServletRequest req = ServletActionContext.getRequest();
		String vcode = (String) req.getSession().getAttribute("vcode");
		String vcode1 = req.getParameter("vcode");
		//判断严重码
		if(!vcode.equalsIgnoreCase(vcode1)){
			context.put("yzmmsg","验证码不正确");
			context.put("user",user);
			return "registerfailed";
		}
		User u = service.fundByEmail(this.user);
		if(u!=null){
			//把错误信息保存到requst域
			context.put("msg","邮箱已被注册");
			context.put("user",user);
			return "registerfailed";
		}
		boolean bool = service.addUser(this.user);
		if(!bool){
			context.put("msg", "注册失败");
			context.put("user", this.user);
			return "registerfailed";
		}
		context.put("msg", "注册成功");
		return "registersuccess";
	}
	
	//用户注销
	public String cancel(){
		ActionContext.getContext().getSession().remove("user");
		return "loginsuccess";
	}
	
	//个人信息
	public String userMsg(){
		return "usermsg";
	}
	
	//修改个人信息
	public String updateUser(){
		User u= (User) ActionContext.getContext().getSession().get("user");
		u.setUsername(this.user.getUsername());
		u.setPassword(this.user.getPassword());
		u.setAge(this.user.getAge());
		u.setSex(this.user.getSex());
		service.updateUser(u);
		ActionContext.getContext().getSession().put("user",u);
		ActionContext.getContext().put("msg", "保存成功");
		return "updateuser";
	}
}