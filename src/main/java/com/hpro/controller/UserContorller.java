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

	// 메인 이동
	/*@RequestMapping(value="home.le")
	public String home() {
		return "home";
	}*/
	
	// 회원가입 폼
	@RequestMapping(value="userJoin.le")
	public String userJoin() {
		return "user/userJoin";
	}
	
	// 회원가입 처리
	@RequestMapping(value="userJoinAction.le", method=RequestMethod.POST)
	public String userJoinAction(@ModelAttribute UserDTO userDTO, Model model) throws Exception{
		int result = userService.join(userDTO);
		model.addAttribute("result", result);
		return "user/userJoinAction";
	}

	// 로그인 폼
	@RequestMapping(value="userLogin.le")
	public String userLogin() {
		return "user/userLogin";
	}
	
	// 로그인 처리
	@RequestMapping(value="userLoginAction.le", method=RequestMethod.POST)
	public String userLoginAction(@ModelAttribute UserDTO userDTO, Model model, HttpSession session) throws Exception {
		int result = 0;
		UserDTO userInfo = userService.login(userDTO);
		
		if(userInfo == null) { // 회원가입이 되지 않은 경우
			result = 1;
			model.addAttribute("result", result);
			return "user/userLoginAction";
		}else {
			if(userInfo.getUserPassword().equals(userDTO.getUserPassword())) {
				// 관리자 로그인
				if(userInfo.getUserID().equals("admin")) {
					session.setAttribute("userInfo",userInfo);
					return "admin/adminMain";
				} // 사용자 로그인
					result = -1;
					session.setAttribute("userInfo", userInfo);
					model.addAttribute("result", result);
					return "user/userLoginAction";
			}else { // 비밀번호 틀렸을 경우
				result = 2;
				model.addAttribute("result", result);
				return "user/userLoginAction";				
			}
		}
	}
	
	// 로그아웃
	@RequestMapping(value="userLogout.le")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "user/userLogin";
	}
	
	// ID 중복확인 - Ajax로 구현
	@ResponseBody
	@RequestMapping(value="idcheck.le", method=RequestMethod.POST)
	public int idcheck(String userID) throws Exception {
		int result = userService.idcheck(userID);
		return result;
	}
	
	// ID 찾기 폼
	@RequestMapping(value="idFind.le")
	public String userFindID() {
		return "user/userFindID";
	}
	
	// ID 찾기 처리
	@RequestMapping(value="idFindAction.le", method=RequestMethod.POST)
	public String idfind(@ModelAttribute UserDTO userDTO, Model model) throws Exception{
		UserDTO id = userService.idfind(userDTO);
		model.addAttribute("userDTO", id);
		return "user/userFindIDResult";
	}
	
	// 비밀번호 찾기
	@RequestMapping(value="passwordFind.le")
	public String userFindPw() {
		return "user/userFindPw";
	}
	
	// 비밀번호 찾기 처리
	@RequestMapping(value="passwordFindAction.le")
	public String pwfind(@ModelAttribute UserDTO userDTO, Model model) throws Exception {
		UserDTO pw = userService.pwfind(userDTO);
		model.addAttribute("userDTO", pw);
		return "user/userFindPwResult";
	}
	
	// 마이페이지 요청
	@RequestMapping(value="userMain.le")
	public String userMain() throws Exception {
		return "user/userMain";
	}
	
	// 회원정보수정 전 비밀번호 확인 폼
	@RequestMapping(value="userInfo.le")
	public String info() throws Exception{
		return "user/userInfo";
	}
	
	// 비밀번호 확인 처리
	@RequestMapping(value="userInfoChk.le", method=RequestMethod.POST)
	public String userInfoChk(String userID, String userPassword, Model model, HttpSession session) throws Exception {
		int result = userService.pwchk(userID, userPassword);
		if(result > 0) {
			return "user/userUpdate";
		}else {
			return "user/userInfoResult";
		}
	}
	
	// 회원정보수정 폼
	@RequestMapping(value="userUpdate.le")
	public String userUpdate() throws Exception{
		return "user/userUpdate";
	}
	
	// 회원정보수정 처리
	@RequestMapping(value="userUpdateAction.le", method=RequestMethod.POST)
	public String userUpdateAction(@ModelAttribute UserDTO userDTO, Model model, HttpSession session) throws Exception {
		int result = userService.update(userDTO);
		model.addAttribute("result", result);
		
		UserDTO userInfo = userService.info(userDTO.getUserID());
		session.setAttribute("userInfo", userInfo);
		
		return "user/userUpdateAction";
	}
	
	// 회원탈퇴
	@RequestMapping(value="userDelete.le")
	public String userDelete() throws Exception{
		return "user/userDelete";
	}
	
	// 회원탈퇴 처리
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
	
	// 관리자 페이지
	@RequestMapping(value="adminMain.le")
	public String admin() throws Exception{
		return "admin/adminMain";
	}
	
	// 관리자 페이지 - 전체 회원 목록
	@RequestMapping(value="userAdmin.le", method=RequestMethod.GET)
	public String userAdmin(Model model, 
			@RequestParam(required=false, defaultValue="1")int page,
			@RequestParam(required=false, defaultValue="1")int range) throws Exception{
		
		// 전체 회원 수
		int listCnt = userService.count();
	
		// Pagination 객체 생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("cnt", listCnt);
		model.addAttribute("pagination", pagination);
		model.addAttribute("list", userService.userAdmin(pagination));
		return "admin/userAdmin";
	}
}