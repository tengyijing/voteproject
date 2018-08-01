package cn.voteproject.service;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.voteproject.dao.UserDao;
import cn.voteproject.domain.User;
import cn.voteproject.untils.HibernateUntils;

/**
 * 处理用户模块
 * @author Administrator
 *
 */
public class UserService {
	private UserDao dao = new UserDao();
	
	//用户登录
	public User login(User user){
		return dao.fundUser(user);
	}
	//添加用户（事务）
	public boolean  addUser(User user){
		//获得Session对象
		Session session = HibernateUntils.getCurrentSession();
		//开启事务
		Transaction tr = session.beginTransaction();
		try {
			user.setIsdel(false);
			dao.addUser(user);
			tr.commit();
		} catch (Exception e) {
			tr.rollback();
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//根据邮箱查询
	public User fundByEmail(User user) {
		// TODO Auto-generated method stub
		return dao.funByEmail(user);
	}
	
	//修改用户信息
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		Session session = HibernateUntils.getCurrentSession();
		Transaction tr = session.beginTransaction();
		try {
			dao.updateUser(user);
			tr.commit();
		} catch (Exception e) {
			tr.rollback();
			System.out.println("修改失败");
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
