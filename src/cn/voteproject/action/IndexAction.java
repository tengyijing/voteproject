package cn.voteproject.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.voteproject.domain.Vote;
import cn.voteproject.service.VoteService;

/**
 * 处理首页数据初始化模块
 * @author Administrator
 *
 */
public class IndexAction extends ActionSupport{

	private static final long serialVersionUID = 1L;

	//主页初始化
	public String indexInit(){
		List<Vote> votelist = new VoteService().getVote();
		if(votelist.size()>6){
			ActionContext.getContext().put("votelist", votelist.subList(0, 6));
		}else{
			ActionContext.getContext().put("votelist", votelist);
		}
		return SUCCESS;
	}
}
