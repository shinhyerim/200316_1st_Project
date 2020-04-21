package com.hpro.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.hpro.commons.Pagination;
import com.hpro.dao.UserDAO;
import com.hpro.dto.UserDTO;

@Repository
public class UserServiceImpl implements UserService {
	@Inject
	private UserDAO userDAO;
	
	// 회원가입
	@Override
	public int join(UserDTO userDTO) throws Exception {
		return userDAO.join(userDTO);
	}
	
	// 로그인
	@Override
	public UserDTO login(UserDTO userDTO) throws Exception {
		return userDAO.login(userDTO);
	}

	// 회원정보 가져오기
	@Override
	public UserDTO info(String userID) throws Exception {
		return userDAO.info(userID);
	}

	// ID 중복확인
	@Override
	public int idcheck(String userID) throws Exception {
		return userDAO.idcheck(userID);
	}

	// ID 찾기
	@Override
	public UserDTO idfind(UserDTO userDTO) throws Exception {
		return userDAO.idfind(userDTO);
	}
	
	// 비밀번호 찾기
	@Override
	public UserDTO pwfind(UserDTO userDTO) throws Exception {
		return userDAO.pwfind(userDTO);
	}
	
	// 비밀번호 확인
	@Override
	public int pwchk(String userID, String userPassword) throws Exception {
		return userDAO.pwchk(userID, userPassword);
	}
	
	// 회원정보 수정
	@Override
	public int update(UserDTO userDTO) throws Exception {
		return userDAO.update(userDTO);
	}

	// 회원탈퇴
	@Override
	public int delete(UserDTO userDTO) throws Exception {
		return userDAO.delete(userDTO);
	}

	// 회원 수 : 관리자 페이지 사용
	@Override
	public int count() throws Exception {
		return userDAO.count();
	}

	// 회원 목록 : 관리자 페이지 사용
	@Override
	public List<UserDTO> userAdmin(Pagination pagination) throws Exception {
		return userDAO.userAdmin(pagination);
	}


}
