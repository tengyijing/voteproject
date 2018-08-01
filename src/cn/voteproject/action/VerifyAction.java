package cn.voteproject.action;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.itcast.vcode.utils.VerifyCode;

//验证码
public class VerifyAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("static-access")
	public String getVerify(){
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse rep = ServletActionContext.getResponse();
		VerifyCode vcode = new VerifyCode();
		BufferedImage image = vcode.getImage();
		req.getSession().setAttribute("vcode", vcode.getText());
		try {
			vcode.output(image,rep.getOutputStream());//把图片输入到指定流
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return NONE;
	}
}
