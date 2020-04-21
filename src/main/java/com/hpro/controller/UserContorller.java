package com.hpro.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hpro.commons.Pagination;
import com.hpro.dto.UserDTO;
import com.hpro.service.UserService;

@Controller
public class UserContorller {
	@Inject
	private UserService userService;

	// ���� �̵�
	/*@RequestMapping(value="home.le")
	public String home() {
		return "home";
	}*/
	
	// ȸ������ ��
	@RequestMapping(value="userJoin.le")
	public String userJoin() {
		return "user/userJoin";
	}
	
	// ȸ������ ó��
	@RequestMapping(value="userJoinAction.le", method=RequestMethod.POST)
	public String userJoinAction(@ModelAttribute UserDTO userDTO, Model model) throws Exception{
		int result = userService.join(userDTO);
		model.addAttribute("result", result);
		return "user/userJoinAction";
	}

	// �α��� ��
	@RequestMapping(value="userLogin.le")
	public String userLogin() {
		return "user/userLogin";
	}
	
	// �α��� ó��
	@RequestMapping(value="userLoginAction.le", method=RequestMethod.POST)
	public String userLoginAction(@ModelAttribute UserDTO userDTO, Model model, HttpSession session) throws Exception {
		int result = 0;
		UserDTO userInfo = userService.login(userDTO);
		
		if(userInfo == null) { // ȸ�������� ���� ���� ���
			result = 1;
			model.addAttribute("result", result);
			return "user/userLoginAction";
		}else {
			if(userInfo.getUserPassword().equals(userDTO.getUserPassword())) {
				// ������ �α���
				if(userInfo.getUserID().equals("admin")) {
					session.setAttribute("userInfo",userInfo);
					return "admin/adminMain";
				} // ����� �α���
					result = -1;
					session.setAttribute("userInfo", userInfo);
					model.addAttribute("result", result);
					return "user/userLoginAction";
			}else { // ��й�ȣ Ʋ���� ���
				result = 2;
				model.addAttribute("result", result);
				return "user/userLoginAction";				
			}
		}
	}
	
	// �α׾ƿ�
	@RequestMapping(value="userLogout.le")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "user/userLogin";
	}
	
	// ID �ߺ�Ȯ�� - Ajax�� ����
	@ResponseBody
	@RequestMapping(value="idcheck.le", method=RequestMethod.POST)
	public int idcheck(String userID) throws Exception {
		int result = userService.idcheck(userID);
		return result;
	}
	
	// ID ã�� ��
	@RequestMapping(value="idFind.le")
	public String userFindID() {
		return "user/userFindID";
	}
	
	// ID ã�� ó��
	@RequestMapping(value="idFindAction.le", method=RequestMethod.POST)
	public String idfind(@ModelAttribute UserDTO userDTO, Model model) throws Exception{
		UserDTO id = userService.idfind(userDTO);
		model.addAttribute("userDTO", id);
		return "user/userFindIDResult";
	}
	
	// ��й�ȣ ã��
	@RequestMapping(value="passwordFind.le")
	public String userFindPw() {
		return "user/userFindPw";
	}
	
	// ��й�ȣ ã�� ó��
	@RequestMapping(value="passwordFindAction.le")
	public String pwfind(@ModelAttribute UserDTO userDTO, Model model) throws Exception {
		UserDTO pw = userService.pwfind(userDTO);
		model.addAttribute("userDTO", pw);
		return "user/userFindPwResult";
	}
	
	// ���������� ��û
	@RequestMapping(value="userMain.le")
	public String userMain() throws Exception {
		return "user/userMain";
	}
	
	// ȸ���������� �� ��й�ȣ Ȯ�� ��
	@RequestMapping(value="userInfo.le")
	public String info() throws Exception{
		return "user/userInfo";
	}
	
	// ��й�ȣ Ȯ�� ó��
	@RequestMapping(value="userInfoChk.le", method=RequestMethod.POST)
	public String userInfoChk(String userID, String userPassword, Model model, HttpSession session) throws Exception {
		int result = userService.pwchk(userID, userPassword);
		if(result > 0) {
			return "user/userUpdate";
		}else {
			return "user/userInfoResult";
		}
	}
	
	// ȸ���������� ��
	@RequestMapping(value="userUpdate.le")
	public String userUpdate() throws Exception{
		return "user/userUpdate";
	}
	
	// ȸ���������� ó��
	@RequestMapping(value="userUpdateAction.le", method=RequestMethod.POST)
	public String userUpdateAction(@ModelAttribute UserDTO userDTO, Model model, HttpSession session) throws Exception {
		int result = userService.update(userDTO);
		model.addAttribute("result", result);
		
		UserDTO userInfo = userService.info(userDTO.getUserID());
		session.setAttribute("userInfo", userInfo);
		
		return "user/userUpdateAction";
	}
	
	// ȸ��Ż��
	@RequestMapping(value="userDelete.le")
	public String userDelete() throws Exception{
		return "user/userDelete";
	}
	
	// ȸ��Ż�� ó��
	@RequestMapping(value="userDeleteAction.le")
	public String userDeleteAction(@ModelAttribute UserDTO userDTO, Model model) throws Exception{
		int pwchk = userService.pwchk(userDTO.getUserID(),userDTO.getUserPassword());
		if(pwchk > 0) {
			model.addAttribute("result", userService.delete(userDTO));
			return "user/userDeleteAction";
		}else {
			return "user/userUpdate";
		}
	}
	
	// ������ ������
	@RequestMapping(value="adminMain.le")
	public String admin() throws Exception{
		return "admin/adminMain";
	}
	
	// ������ ������ - ��ü ȸ�� ���
	@RequestMapping(value="userAdmin.le", method=RequestMethod.GET)
	public String userAdmin(Model model, 
			@RequestParam(required=false, defaultValue="1")int page,
			@RequestParam(required=false, defaultValue="1")int range) throws Exception{
		
		// ��ü ȸ�� ��
		int listCnt = userService.count();
	
		// Pagination ��ü ����
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("cnt", listCnt);
		model.addAttribute("pagination", pagination);
		model.addAttribute("list", userService.userAdmin(pagination));
		return "admin/userAdmin";
	}
}