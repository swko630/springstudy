package com.gdu.prj03.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.prj03.dao.BoardDao;

@Controller
public class WelcomControlller {

  
  @GetMapping(value= {"/", "/main.do"})
  public String welcome() {
        
    return "index";
  }
  
}
