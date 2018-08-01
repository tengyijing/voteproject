package cn.voteproject.action;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.itcast.commons.CommonUtils;
import cn.voteproject.domain.Pager;
import cn.voteproject.domain.User;
import cn.voteproject.domain.Vote;
import cn.voteproject.domain.VoteOption;
import cn.voteproject.service.VoteService;

/**
 * 处理投票活动请求模块
 * @author Administrator
 *
 */
public class VoteAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<File> optionimg; // 用List集合来封装多个上传文件域对象 xxx
	private List<String> optionimgFileName; //用List数组来封装多个上传文件名xxxFileName
	private List<VoteOption> voteoptionlist;//将选项数据封装到VoteOption对象中
	
	public List<VoteOption> getVoteoptionlist() {
		return voteoptionlist;
	}
	public void setVoteoptionlist(List<VoteOption> voteoptionlist) {
		this.voteoptionlist = voteoptionlist;
	}
	public List<File> getOptionimg() {
		return optionimg;
	}
	public void setOptionimg(List<File> optionimg) {
		this.optionimg = optionimg;
	}
	public List<String> getOptionimgFileName() {
		return optionimgFileName;
	}
	public void setOptionimgFileName(List<String> optionimgFileName) {
		this.optionimgFileName = optionimgFileName;
	}
	
	//跳转到活动创建页
	public String adVote(){
		
		return "advote";
	}
	
	//添加投票
	public String addVote(){
		Vote vote = new Vote();
		HttpServletRequest req = ServletActionContext.getRequest();
		vote.setVotetitle(req.getParameter("votetitle"));//设置标题
		if(!"单选".equals(req.getParameter("ischeck"))){
			vote.setIscheck(true);
		}
		String time = req.getParameter("overtime");
		//处理时间格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			vote.setOvertime(sdf.parse(time));
		} catch (ParseException e) {
			System.out.println("时间转换错误");
			e.printStackTrace();
		}
		
		/*
		 * 上传文件
		 */
		//获取图片存储真实路径
		String savepath = ServletActionContext.getServletContext().getRealPath("/voteoptionimg");
		if(optionimg!=null&&optionimg.size()>0){
			for(int i=0;i<optionimg.size();i++){
				String uuid = CommonUtils.uuid();//获取UUID进行文件打撒
				//filename，文件名称
				String filename = uuid+"_"+optionimgFileName.get(i);//新的文件名称为uuid + 下划线 + 原始名称
				//因为这个路径可能不存在，所以创建成File对象，再创建目录链，确保目录在保存文件之前已经存在
				new File(savepath).mkdirs();
				//创建file对象，下面会把上传文件保存到这个file指定的路径
				//savepath，即上传文件的保存目录
				File file = new File(savepath, filename);
				//上传文件
				try {
					FileUtils.copyFile(optionimg.get(i), file);
				} catch (IOException e) {
					System.out.println("文件上传失败！！！");
					e.printStackTrace();
				}
				//将文件路径保存到选项
				voteoptionlist.get(i).setImgsrc("voteoptionimg/"+filename);
				//添加到所属活动
				vote.getOptionset().add(voteoptionlist.get(i));
				voteoptionlist.get(i).setVote(vote);
			}
		}else{
			for(int i=0;i<voteoptionlist.size();i++){
				vote.getOptionset().add(voteoptionlist.get(i));
				voteoptionlist.get(i).setVote(vote);
			}
		}
		User user = (User) req.getSession().getAttribute("user");
		user.getVoteset().add(vote);
		vote.setUser(user);
		new VoteService().addVote(vote);
		return "uservotelist";
	}
	
	//分页查询数据
	public String getPageVote(){
		Pager<Vote> page = new Pager<Vote>();
		//获取当前页
		String pc = ServletActionContext.getRequest().getParameter("pc");
		int index=0;
		if(pc==null){
			index=1;
		}else{
			index = Integer.parseInt(pc);
		}
		page = new VoteService().getPageVote(index);
		ActionContext.getContext().put("page", page);
		return "page";
	}
	//获取用户发布的活动
	public String getUserVote(){
		User user = (User) ActionContext.getContext().getSession().get("user");		
		List<Vote> votelist = new VoteService().getUserVote(user);
		//处理结束
		for(Vote vote : votelist){
			//获取当前时间
			Date date  = new Date();
			//判断活动是否结束
			if(vote.getOvertime().before(date)){
				vote.setIsover(1);
			}
		}
		ActionContext.getContext().put("votelist", votelist);
		return "uservotelistjsp";
	}
	
	//用户参加的活动
	public String joinVot(){
		User user = (User)ActionContext.getContext().getSession().get("user");
		//处理是否结束
		for(Vote vote : user.getVotes()){
			//获取当前时间
			Date date  = new Date();
			//判断活动是否结束
			if(vote.getOvertime().before(date)){
				vote.setIsover(1);
			}
		}
		ActionContext.getContext().put("votelist", user.getVotes());
		//用于页面判断是参加还是发布
		ActionContext.getContext().put("join", "join");
		return "uservotelistjsp";
	}
	
	//获取投票活动的选择项
	public String getVoteOption(){
		//获取投票活动ID
		String vid = ServletActionContext.getRequest().getParameter("vid");
		Vote vote = new VoteService().getVoteOption(vid);
		//获取当前时间
		Date date  = new Date();
		//判断活动是否结束
		if(vote.getOvertime().before(date)){
			vote.setIsover(1);
		}
		ActionContext.getContext().put("vote", vote);
		return "voteoptionlistjsp";
	}
	
	//投票
	public String vote(){
		//投票者
		User user = (User)ActionContext.getContext().getSession().get("user");
		HttpServletRequest req = ServletActionContext.getRequest();
		//获取id数组
		String[] idString = req.getParameterValues("Choice");
		//转换id
		List<Integer> idlist = new ArrayList<Integer>();
		for(String str : idString){
			idlist.add(Integer.parseInt(str));
		}
		Vote vote = new VoteService().vote(idlist,user);
		ActionContext.getContext().put("vote", vote);
		return "voteoptionlistjsp";
	}
}
