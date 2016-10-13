package com.facade;

import com.model.UserToken;

public interface UserDetailFascade {

	boolean saveUser(UserToken tokenResponse);
	boolean userSignInSignUp(UserToken tokenResponse);
}
