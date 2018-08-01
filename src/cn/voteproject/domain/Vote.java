package cn.voteproject.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 投票活动实体类
 */
public class Vote {
	/*
	 * `vid` char(32) NOT NULL ,
  `votetitle` varchar(255) DEFAULT NULL,
  `overtime` datetime NOT NULL,
  `isover` tinyint(1) NOT NULL,
  `ischeck` tinyint(1) NOT NULL,
  `isanonymous` tinyint(1) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `userid` char(32) NOT NULL,
	 */
	private String vid;//投票活动主键
	private String votetitle;//投票主题
	private Date overtime;//结束时间
	private int isover;//是否结束
	private boolean ischeck = false;//是否多选
	private int amount;//总票数
	private int vamount;//浏览量
	private User user;//发起人
	
	//保存所有选项
	//Hibernate默认使用的集合是Set集合.
	private Set<VoteOption> optionset = new HashSet<VoteOption>();
	
	//保存参与者与活动的多对多关联
	private Set<User> users = new HashSet<User>();

	public String getVid() {
		return vid;
	}

	public void setVid(String vid) {
		this.vid = vid;
	}

	public String getVotetitle() {
		return votetitle;
	}

	public void setVotetitle(String votetitle) {
		this.votetitle = votetitle;
	}

	public Date getOvertime() {
		return overtime;
	}

	public void setOvertime(Date overtime) {
		this.overtime = overtime;
	}

	public int getIsover() {
		return isover;
	}

	public void setIsover(int isover) {
		this.isover = isover;
	}

	public boolean isIscheck() {
		return ischeck;
	}

	public void setIscheck(boolean ischeck) {
		this.ischeck = ischeck;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getVamount() {
		return vamount;
	}

	public void setVamount(int vamount) {
		this.vamount = vamount;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<VoteOption> getOptionset() {
		return optionset;
	}

	public void setOptionset(Set<VoteOption> optionset) {
		this.optionset = optionset;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}
	
}
