package com.hpro.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hpro.commons.Pagination;
import com.hpro.dto.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Inject
	private SqlSessionTemplate sst;

	// 회원가입
	@Override
	public int join(UserDTO userDTO) throws Exception {
		return sst.insert("userMapper.join", userDTO);
	}
	
	// 로그인
	@Override
	public UserDTO login(UserDTO userDTO) throws Exception {
		return sst.selectOne("userMapper.info", userDTO);
	}

	// 회원정보 가져오기
	@Override
	public UserDTO info(String userID) throws Exception {
		return sst.selectOne("userMapper.info", userID);
	}

	// ID 중복확인
	@Override
	public int idcheck(String userID) throws Exception {
		return sst.selectOne("userMapper.idcheck",userID);
	}
	
	// ID 찾기
	@Override
	public UserDTO idfind(UserDTO userDTO) throws Exception {
		return sst.selectOne("userMapper.idfind", userDTO);
	}

	// 비밀번호 찾기
	@Override
	public UserDTO pwfind(UserDTO userDTO) throws Exception {
		return sst.selectOne("userMapper.pwfind",userDTO);
	}

	// 비밀번호 확인
	@Override
	public int pwchk(String userID, String userPassword) throws Exception {
		// SQL의 인수로 2개를 줄 수 없으므로 Map을 이용하여 저장 후 전달해줌
		int result = 0;
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("userID", userID);
			map.put("userPassword", userPassword);

			result = sst.selectOne("userMapper.pwchk", map);

			if(result > 0) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	// 회원정보수정
	@Override
	public int update(UserDTO userDTO) throws Exception {
		return sst.update("userMapper.update", userDTO);
	}

	// 회원탈퇴
	@Override
	public int delete(UserDTO userDTO) throws Exception {
		return sst.delete("userMapper.delete", userDTO);
	}

	// 회원 수 : 관리자 페이지 사용
	@Override
	public int count() throws Exception {
		return sst.selectOne("userMapper.count");
	}

	// 회원 목록 : 관리자 페이지 사용
	@Override
	public List<UserDTO> userAdmin(Pagination pagination) throws Exception {
		return sst.selectList("userMapper.userAdmin", pagination);
	}
}
