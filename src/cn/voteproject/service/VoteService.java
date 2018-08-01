package cn.voteproject.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.voteproject.dao.VoteDao;
import cn.voteproject.domain.Pager;
import cn.voteproject.domain.User;
import cn.voteproject.domain.Vote;
import cn.voteproject.domain.VoteOption;
import cn.voteproject.untils.HibernateUntils;

/**
 * 投票活动模块
 * @author Administrator
 *
 */
public class VoteService {
	VoteDao dao  = new VoteDao();
	
	//创建投票活动
	public void addVote(Vote vote) {
		// TODO Auto-generated method stub
		Session session = HibernateUntils.getCurrentSession();
		Transaction tr = session.beginTransaction();
		try {
			dao.addVote(vote);
			tr.commit();
		} catch (Exception e) {
			tr.rollback();
			System.out.println("数据保存失败");
			e.printStackTrace();
		}
	}
	//获取用户发布的投票活动
	public List<Vote> getUserVote(User user) {
		// TODO Auto-generated method stub
		return dao.getUserVote(user);
	}
	//获取投票项
	public Vote getVoteOption(String vid) {
		// TODO Auto-generated method stub
		Vote vote = null;
		Session session = HibernateUntils.getCurrentSession();
		Transaction tr = session.beginTransaction();
		try {
			vote = dao.getVoteOption(vid);
			//活动
			vote.setVamount(vote.getVamount()+1);
			dao.updateVamount(vote);
			tr.commit();
		} catch (Exception e) {
			tr.rollback();
			System.out.println("查询修改失败");
			// TODO: handle exception
			e.printStackTrace();
		}
		return vote; 
	}
	//投票
	public Vote vote(List<Integer> idlist,User user) {
		// TODO Auto-generated method stub;
		Session session = HibernateUntils.getCurrentSession();
		Transaction tr = session.beginTransaction();
		try {
			Vote vote = null;
			for(Integer vptid : idlist){
				VoteOption option  = dao.getOptinById(vptid);
				option.setAmount(option.getAmount()+1);
				vote = option.getVote();
				//投票数
				vote.setAmount(vote.getAmount()+1);
				//建立参与者与活动的关联
				vote.getUsers().add(user);
				user.getVotes().add(vote);
				//建立参与者与选项的关联
				option.getUsers().add(user);
				user.getOptionset().add(option);
				dao.joinVote(user);
				dao.vote(option);
			}
			tr.commit();
			return vote;
		} catch (Exception e) {
			// TODO: handle exception
			tr.rollback();
			System.out.println("投票失败!!");
			e.printStackTrace();
		}
		return null;
	}
	//获取首页票活动
	public List<Vote> getVote() {
		// TODO Auto-generated method stub
		return dao.getVote();
	}
	
	//分页查询投票活动
	public Pager<Vote> getPageVote(int pc){
		Pager<Vote> page = new Pager<Vote>();
		Session session = HibernateUntils.getCurrentSession();
		Transaction tr = session.beginTransaction();
		try {
			//查询该页面的数据
			page.setVoteList(dao.getPageVote(pc));
			//查询总数据
			page.setTr(dao.getAmount());
			//设置当前页
			page.setPc(pc);
			//设置页面数据
			page.setPs(6);
			//设置总页面数
			int amount = (int) (page.getTr()/6);
			if(page.getTr()%6>0){
				amount++;
			}
			page.setTp(amount);
			tr.commit();
		} catch (Exception e) {
			System.out.println("查询失败");
			tr.rollback();
			e.printStackTrace();
			// TODO: handle exception
		}
		return page;
	}
}
