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
	
	// ȸ������
	@Override
	public int join(UserDTO userDTO) throws Exception {
		return userDAO.join(userDTO);
	}
	
	// �α���
	@Override
	public UserDTO login(UserDTO userDTO) throws Exception {
		return userDAO.login(userDTO);
	}

	// ȸ������ ��������
	@Override
	public UserDTO info(String userID) throws Exception {
		return userDAO.info(userID);
	}

	// ID �ߺ�Ȯ��
	@Override
	public int idcheck(String userID) throws Exception {
		return userDAO.idcheck(userID);
	}

	// ID ã��
	@Override
	public UserDTO idfind(UserDTO userDTO) throws Exception {
		return userDAO.idfind(userDTO);
	}
	
	// ��й�ȣ ã��
	@Override
	public UserDTO pwfind(UserDTO userDTO) throws Exception {
		return userDAO.pwfind(userDTO);
	}
	
	// ��й�ȣ Ȯ��
	@Override
	public int pwchk(String userID, String userPassword) throws Exception {
		return userDAO.pwchk(userID, userPassword);
	}
	
	// ȸ������ ����
	@Override
	public int update(UserDTO userDTO) throws Exception {
		return userDAO.update(userDTO);
	}

	// ȸ��Ż��
	@Override
	public int delete(UserDTO userDTO) throws Exception {
		return userDAO.delete(userDTO);
	}

	// ȸ�� �� : ������ ������ ���
	@Override
	public int count() throws Exception {
		return userDAO.count();
	}

	// ȸ�� ��� : ������ ������ ���
	@Override
	public List<UserDTO> userAdmin(Pagination pagination) throws Exception {
		return userDAO.userAdmin(pagination);
	}


}
