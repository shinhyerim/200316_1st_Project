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

	// ȸ������
	@Override
	public int join(UserDTO userDTO) throws Exception {
		return sst.insert("userMapper.join", userDTO);
	}
	
	// �α���
	@Override
	public UserDTO login(UserDTO userDTO) throws Exception {
		return sst.selectOne("userMapper.info", userDTO);
	}

	// ȸ������ ��������
	@Override
	public UserDTO info(String userID) throws Exception {
		return sst.selectOne("userMapper.info", userID);
	}

	// ID �ߺ�Ȯ��
	@Override
	public int idcheck(String userID) throws Exception {
		return sst.selectOne("userMapper.idcheck",userID);
	}
	
	// ID ã��
	@Override
	public UserDTO idfind(UserDTO userDTO) throws Exception {
		return sst.selectOne("userMapper.idfind", userDTO);
	}

	// ��й�ȣ ã��
	@Override
	public UserDTO pwfind(UserDTO userDTO) throws Exception {
		return sst.selectOne("userMapper.pwfind",userDTO);
	}

	// ��й�ȣ Ȯ��
	@Override
	public int pwchk(String userID, String userPassword) throws Exception {
		// SQL�� �μ��� 2���� �� �� �����Ƿ� Map�� �̿��Ͽ� ���� �� ��������
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
	
	// ȸ����������
	@Override
	public int update(UserDTO userDTO) throws Exception {
		return sst.update("userMapper.update", userDTO);
	}

	// ȸ��Ż��
	@Override
	public int delete(UserDTO userDTO) throws Exception {
		return sst.delete("userMapper.delete", userDTO);
	}

	// ȸ�� �� : ������ ������ ���
	@Override
	public int count() throws Exception {
		return sst.selectOne("userMapper.count");
	}

	// ȸ�� ��� : ������ ������ ���
	@Override
	public List<UserDTO> userAdmin(Pagination pagination) throws Exception {
		return sst.selectList("userMapper.userAdmin", pagination);
	}
}
