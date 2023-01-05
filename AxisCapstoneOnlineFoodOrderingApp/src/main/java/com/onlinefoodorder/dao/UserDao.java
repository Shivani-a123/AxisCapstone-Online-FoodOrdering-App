package com.onlinefoodorder.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.onlinefoodorder.model.Users;

@Repository
public interface UserDao extends JpaRepository<Users, Integer> {
	
	Users findByEmailidAndPassword(String emailId, String password);
	Users findByEmailid(String emailId);
	Users findByEmailidAndMobileno(String emailId, String mobileNo);

}
