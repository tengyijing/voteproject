package cn.voteproject.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import cn.voteproject.domain.User;
import cn.voteproject.domain.Vote;
import cn.voteproject.domain.VoteOption;
import cn.voteproject.untils.HibernateUntils;


/**
 * 投票活动的crud操作
 */
public class VoteDao {

	//创建投票活动
	public void addVote(Vote vote) {
		// TODO Auto-generated method stub
		Session session = HibernateUntils.getCurrentSession();
		session.save(vote);
	}
	
	//获取用户发布的投票活动
	public List<Vote> getUserVote(User user){
		Session session = HibernateUntils.getSession();
		Query query = session.createQuery("from Vote where userid=?");
		query.setParameter(0, user.getUserid());
		@SuppressWarnings("unchecked")
		List<Vote> list = query.list();
		return list;
	}
	
	//获取投票项
	public Vote getVoteOption(String vid) {
		// TODO Auto-generated method stub
		Session session = HibernateUntils.getCurrentSession();
		Query query = session.createQuery("from Vote where vid=?");
		query.setParameter(0, vid);
		Vote vote = (Vote) query.list().get(0);
		return vote;
	}

	//修改浏览量
	public void updateVamount(Vote vote) {
		// TODO Auto-generated method stub
		Session session = HibernateUntils.getCurrentSession();
		session.update(vote);
	}

	//投票
	public void vote(VoteOption option) {
		// TODO Auto-generated method stub
		Session session = HibernateUntils.getCurrentSession();
		session.merge(option);
	}
	
	//根据id值查询id
	public VoteOption getOptinById(int vptid) {
		// TODO Auto-generated method stub
		Session session  = HibernateUntils.getCurrentSession();
		Query query = session.createQuery("from VoteOption where vptid=?");
		query.setParameter(0, vptid);
		VoteOption option = (VoteOption) query.list().get(0);
		return option;
	}
	
	//保存参加的投票活动和投票
	public void joinVote(User user) {
		// TODO Auto-generated method stub
		Session sesion = HibernateUntils.getCurrentSession();
		sesion.merge(user);
	}
	
	//获取首页投票活动
	public List<Vote> getVote() {
		Session session  = HibernateUntils.getSession();
		Query query  = session.createQuery("from Vote where overtime>? Order by amount desc");
		query.setDate(0, new Date());
		query.setFirstResult(0);
		query.setMaxResults(6);
		@SuppressWarnings("unchecked")
		List<Vote> list = query.list();
		session.close();
		return list;
	}
	
	//分页查询投票活动
	public List<Vote> getPageVote(int pc){
		Session session = HibernateUntils.getCurrentSession();
		Query query = session.createQuery("from Vote where overtime>? Order by amount desc");
		query.setDate(0, new Date());
		query.setFirstResult((pc-1)*6);
		query.setMaxResults(6);
		@SuppressWarnings("unchecked")
		List<Vote> votelist = query.list();
		return votelist;
	}

	//获取所有活动数
	public Long getAmount() {
		Session session = HibernateUntils.getCurrentSession();
		Query query = session.createQuery("select count(*) from Vote where overtime>?");
		query.setDate(0, new Date());
		Long num = (Long) query.uniqueResult();
		return num;
	}
}


