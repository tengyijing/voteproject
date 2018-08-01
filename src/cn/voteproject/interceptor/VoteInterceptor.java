package cn.voteproject.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import cn.voteproject.domain.User;


//处理用户是否登录问题
public class VoteInterceptor extends MethodFilterInterceptor {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		Map<String, Object> session  = invocation.getInvocationContext().getSession();
		User user = (User)session.get("user");
		if(user!=null){
			return invocation.invoke();
		}
		return "loginerror";
	}
}
