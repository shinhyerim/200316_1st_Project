package com.hpro.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hpro.commons.Pagination;
import com.hpro.dto.UserDTO;

@Service
public interface UserService {
	
	// 회원가입
	public int join(UserDTO userDTO) throws Exception;
	
	// 로그인
	public UserDTO login(UserDTO userDTO) throws Exception;
	
	// 회원정보가져오기
	public UserDTO info(String userID) throws Exception;
	
	// ID 중복확인
	public int idcheck(String userID) throws Exception;
	
	// ID 찾기
	public UserDTO idfind(UserDTO userDTO) throws Exception;
	
	// 비밀번호 찾기
	public UserDTO pwfind(UserDTO userDTO) throws Exception;
	
	// 비밀번호 확인
	public int pwchk(String userID, String userPassword) throws Exception;
	
	// 회원정보 수정
	public int update(UserDTO userDTO) throws Exception;
	
	// 회원탈퇴
	public int delete(UserDTO userDTO) throws Exception;
	
	// 회원 수 : 관리자 페이지 사용
	public int count() throws Exception;
	 
	// 회원 목록 : 관리자 페이지 사용
	public List<UserDTO> userAdmin(Pagination pagination) throws Exception;
	
	
}
