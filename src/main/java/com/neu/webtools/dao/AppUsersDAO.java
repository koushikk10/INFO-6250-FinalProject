package com.neu.webtools.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import com.neu.webtools.pojo.AppUsers;
import com.neu.webtools.pojo.JobApplication;

public class AppUsersDAO extends DAO {
	
	public AppUsersDAO() {
		
	}
	
	// Function for login
	public AppUsers get(String username, String password) throws Exception{
		try {
			begin();
			Query query = getSession().createQuery("from AppUsers where username = :username and password = :password");
			query.setString("username", username);
			query.setString("password", password);
			AppUsers user = (AppUsers) query.uniqueResult();
			close();
			
			if(user == null) {
				System.out.println("No User found in DAO Class");
				return null;
			}else {
				System.out.println("User "+user.getFname()+" has been logged in");
				return user;
			}
//			
		}catch(HibernateException e){
			rollback();
			throw new Exception("Invalid username or password");
		}
		
	}
	
	// Function for registration
	public AppUsers registerUser(AppUsers user) {
		try {
			begin();
			System.out.println("INSIDE THE registerUser METHOD");
			getSession().save(user);
			commit();
			close();
			return user;
		}catch(HibernateException e){
			rollback();
			e.printStackTrace();
			return null;
		}
		
	}
	
	//Criteria for registration
	public boolean registerCriteria(String email, String username) {
		try {
			boolean result = true;
			System.out.println("Inside CRITERIA METHOD");
			begin();
			Criteria criteria = getSession().createCriteria(AppUsers.class);
			criteria.add(Restrictions.eq("email", email));
			List<AppUsers> crit1 = criteria.list();
			criteria.add(Restrictions.eq("username", username));
			List<AppUsers> crit2 = criteria.list();
			System.out.println("EMAIL SIZE "+crit1.size()+" USERNAME SIZE"+crit2.size());
			commit();
			close();
			if((crit1.size() == 1) || (crit2.size() == 1)) {
				result = true;
			}else {
				result = false;
			}
			return result;
		}catch(HibernateException e){
			rollback();
			e.printStackTrace();
		}
		return true;
	}
}

