package cn.voteproject.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import cn.voteproject.domain.User;
import cn.voteproject.untils.HibernateUntils;

/**
 * 用户的crud操作
 * @author Administrator
 *
 */
public class UserDao {

	//根据用户邮箱和密码查询用户
	public User fundUser(User user) {
		Session session = HibernateUntils.getSession();
		Criteria criteria = session.createCriteria(User.class);
		criteria.add(Restrictions.eq("email", user.getEmail()));
		criteria.add(Restrictions.eq("password", user.getPassword()));
		@SuppressWarnings("unchecked")
		List<User> list = criteria.list();
		if(list.size()>0)
			return list.get(0);
		return null;
	}
	
	//添加用户
	public void addUser(User user){
		Session session  =  HibernateUntils.getCurrentSession();
		session.save(user);
	}
	
	//根据邮箱查询
	public User funByEmail(User user) {
		Session session = HibernateUntils.getSession();
		Criteria criteria = session.createCriteria(User.class);
		criteria.add(Restrictions.eq("email", user.getEmail()));
		@SuppressWarnings("unchecked")
		List<User> list = criteria.list();
		session.close();
		if(list.size()>0)
			return list.get(0);
		return null;
	}
	
	//修改用户信息
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		Session session = HibernateUntils.getCurrentSession();
		session.merge(user);
	}
}
