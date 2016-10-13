package com.facade;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dao.UserDetailDAO;
import com.model.UserDetails;
import com.model.UserToken;

@Component
public class UserDetailFascadeImpl implements UserDetailFascade {

	@Autowired
	UserDetails userVO;

	@Autowired
	UserDetailDAO userDetailDAO;

	public boolean saveUser(UserToken tokenResponse) {

		System.out.println(userVO);
		return false;
	}

	@Override
	public boolean userSignInSignUp(UserToken tokenResponse) {
		userVO.setGoogleId(tokenResponse.getSub());
		userVO.setEmailId(tokenResponse.getEmail());
		userVO.setPictureURL(tokenResponse.getPicture());
		userVO.setName(tokenResponse.getName());
		userVO.setRole("general");
		System.out.println("fascade");
		return userDetailDAO.userSignInSignUp(userVO);
	}
}
