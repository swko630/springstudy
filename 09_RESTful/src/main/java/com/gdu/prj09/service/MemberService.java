package com.gdu.prj09.service; // 하나의 서비스는 여러개의 dao를 호출할 수 있다.

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;

public interface MemberService {
  
  // /prj09/members/page/1/display/20 => 경로처럼 주소가 나오게 => @PathVariable
  ResponseEntity<Map<String, Object>> getMembers(int page, int display); // @ResponseBody를 품고있다
  ResponseEntity<Map<String, Object>> getMemberByNo(int memberNo);
  ResponseEntity<Map<String, Object>> registerMember(Map<String, Object> map, HttpServletResponse response);
  ResponseEntity<Map<String, Object>> modifyMember(Map<String, Object> map);
  ResponseEntity<Map<String, Object>> removeMember(int memberNo);
  ResponseEntity<Map<String, Object>> removeMembers(String memberNoList);
  
  
}
/*
/members -------> getMembers(int page, int display) ---------> getTotalMemberCount()
 *                                                             getMemberList(Map map)
 */



