package cn.voteproject.untils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUntils {
	private static final Configuration COFIG;
	private static final SessionFactory FACTORY;
	
	//初始化参数
	static{
		COFIG = new Configuration().configure();
		FACTORY = COFIG.buildSessionFactory();
	}
	
	//获得普通Session
	public static Session getSession(){
		
		return FACTORY.openSession();
	}
	
	//获取线程绑定Session 底层使用（ThreadLocal实现  key:当前线程  value:Sessiond对象）
	public static Session getCurrentSession(){
		return FACTORY.getCurrentSession();
	}
}
