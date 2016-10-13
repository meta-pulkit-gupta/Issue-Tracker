package com.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.UserDetails;

@Repository
public class UserDetailDAOImpl implements UserDetailDAO {

	@Autowired
	private SessionFactory sessionFactory; // To create a session for the
											// database operation

	@Override
	public boolean userSignInSignUp(UserDetails userVO) {
		try {
			System.out.println("DAO");
			Session session = sessionFactory.openSession();
			Criteria criteriaQuery = session.createCriteria(UserDetails.class);
			criteriaQuery
					.add(Restrictions.eq("googleId", userVO.getGoogleId()));
			if (criteriaQuery.uniqueResult() == null) {
				System.out.println("No Entries");
				session.beginTransaction();
				System.out.println(userVO.getRole());
				session.save(userVO);
				session.getTransaction().commit();
			}
			System.out.println("DAO end");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
