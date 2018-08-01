package cn.voteproject.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * 
 * 投票选项实体类
 * @author Administrator
 *
 */
public class VoteOption {
	/*
	 * `vptid` char(32) NOT NULL AUTO_INCREMENT,
  `optionvalue` varchar(255) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `vid` int(11) NOT NULL,
	 */
	private int vptid;//选项id
	private String name;//选项内容
	private String imgsrc;//选项图片地址
	private int amount;//所得的票数
	private Vote vote;//所属活动
	
	//储存选择此项的用户
	private Set<User> users = new HashSet<User>();
	
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public int getVptid() {
		return vptid;
	}
	public void setVptid(int vptid) {
		this.vptid = vptid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getImgsrc() {
		return imgsrc;
	}
	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}
	public Vote getVote() {
		return vote;
	}
	public void setVote(Vote vote) {
		this.vote = vote;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
}
