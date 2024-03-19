package com.gdu.prj05.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.prj05.service.ContactService;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RequestMapping(value="/contact")
@RequiredArgsConstructor
@Controller
public class ContactController {
  
  private final ContactService contactService;
  
 // private static final Logger log = LoggerFactory.getLogger(ContactController.class); // ContactController가 동작할때 로그를 찍는 코드
 //                                                                                     (롬복 애너테이션 @Slf4j 가 대신 동작할 수 있다)
  
  
  @GetMapping(value="/list.do")
  public String list(HttpServletRequest request, Model model) {
    log.info(request.getMethod() + "/" + request.getRequestURI());
    model.addAttribute("contactList", contactService.getContactList());  
    return "contact/list";
  }
  
  @GetMapping(value="/detail.do")
  public String detail(HttpServletRequest request,@RequestParam(value="contact-no", required=false, defaultValue = "0") int contactNo
                      , Model model) {
    log.info(request.getMethod() + "/" + request.getRequestURI());
    model.addAttribute("contact", contactService.getContactByNo(contactNo));
    return "contact/detail";
  }
  
  @GetMapping(value="/write.do")
  public String write(HttpServletRequest request) {
    log.info(request.getMethod() + "/" + request.getRequestURI());
    return "contact/write";
  }
  
  @PostMapping(value="/register.do")
  public void register(HttpServletRequest request, HttpServletResponse response) {
    log.info(request.getMethod() + "/" + request.getRequestURI());
    contactService.registerContact(request, response);
  }
  
  @GetMapping(value="/remove.do")
  public void remove1(HttpServletRequest request, HttpServletResponse response) {
    log.info(request.getMethod() + "/" + request.getRequestURI());
    contactService.removeContact(request, response);
  }
  @PostMapping(value="/remove.do") // 매핑이 같아도 메소드가 다르면 다른 요청으로 본다 - 매핑이 같으면 원래 프로그램이 뻗는다.
  public void remove2(HttpServletRequest request, HttpServletResponse response) {
    log.info(request.getMethod() + "/" + request.getRequestURI());
    contactService.removeContact(request, response);
  }
  @PostMapping(value="/modify.do")
  public void modify(HttpServletRequest request, HttpServletResponse response) {
    log.info(request.getMethod() + "/" + request.getRequestURI());
    contactService.modifyContact(request, response);
  }
  
  
  
  

}
