package cn.voteproject.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * 用户实体类
 * @author Administrator
 *
 */
public class User {
	/*
	   `userid` char(32) NOT NULL,
	   `username` char(50) DEFAULT NULL,
	   `password` varchar(255) NOT NULL,
	   `email` varchar(255) NOT NULL,
	   `sex` tinyint(1) DEFAULT NULL,
	   `age` int(11) DEFAULT NULL,
	   `isdel` tinyint(1) NOT NULL,
	 */
	private String userid;
	private String username;
	private String password;
	private String email;
	private int age;
	private int sex;
	private boolean isdel;
	
	//存储用户发布的活动
	private Set<Vote> voteset = new HashSet<Vote>();
	
	//储存用户所选的项
	private Set<VoteOption> optionset = new HashSet<VoteOption>();
	
	//存储用户参与的投票活动
	private Set<Vote> votes = new HashSet<Vote>();
	
	
	public Set<Vote> getVotes() {
		return votes;
	}
	public void setVotes(Set<Vote> votes) {
		this.votes = votes;
	}
	public Set<VoteOption> getOptionset() {
		return optionset;
	}
	public void setOptionset(Set<VoteOption> optionset) {
		this.optionset = optionset;
	}
	public Set<Vote> getVoteset() {
		return voteset;
	}
	public void setVoteset(Set<Vote> voteset) {
		this.voteset = voteset;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public boolean isIsdel() {
		return isdel;
	}
	public void setIsdel(boolean isdel) {
		this.isdel = isdel;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", age=" + age + ", sex=" + sex + ", isdel=" + isdel + "]";
	}
	
	
}
