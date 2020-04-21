package com.hpro.dao;

import java.util.List;

import com.hpro.commons.Pagination;
import com.hpro.dto.UserDTO;

public interface UserDAO {
	
	// ȸ������
	public int join(UserDTO userDTO) throws Exception;
	
	// ID �ߺ�Ȯ��
	public int idcheck(String userID) throws Exception;
	
	// �α���
	public UserDTO login(UserDTO userDTO) throws Exception;
	
	// ȸ������ ��������
	public UserDTO info(String userID) throws Exception;
	
	// ID ã��
	public UserDTO idfind(UserDTO userDTO) throws Exception;
	
	// ��й�ȣ ã��
	public UserDTO pwfind(UserDTO userDTO) throws Exception;
	
	// ��й�ȣ Ȯ��
	public int pwchk(String userID, String userPassword) throws Exception;
	
	// ȸ������ ����
	public int update(UserDTO userDTO) throws Exception;
	
	// ȸ��Ż��
	public int delete(UserDTO userDTO) throws Exception;
	
	// ȸ�� �� 
	public int count() throws Exception;
	
	// ��ü ȸ�� ���
	public List<UserDTO> userAdmin(Pagination pagination) throws Exception;
	
	
}
